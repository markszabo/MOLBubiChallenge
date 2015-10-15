clear;

%task = 'DSDP';
task = 'BRP';

days = cell(1,121);
days{1} = day('2015-01-01');

traincsv = fopen('mol_bubi_dataset/train.csv','r'); % open csv file for reading
fgets(traincsv); %get rid of the header
daynr = 1;
month = 1;
dayn = 1;
hour = 0;
tmpHalfHour = halfHour.empty;
nrOfHalfHours = 1;
while ~feof(traincsv)
    line = fgets(traincsv); % read line by line
    row = strsplit(line,',');
    newTrip = trip(row{1}, row{2}, row{3}, row{4}, strtrim(row{5})); %TODO make it nicer
    actualMonth = str2double(row{2}(6:7));
    actualDay = str2double(row{2}(9:10));
    actualHour = str2double(row{2}(12:13));
    if str2double(row{2}(15:16)) >= 30
        actualHour = actualHour + 0.5;
    end
    if(isempty(tmpHalfHour))%at first run it is empty
        tmpHalfHour = halfHour(actualMonth, actualDay, actualHour); 
    end
    if(tmpHalfHour.hour ~= actualHour) %if new halfHour
        days{daynr}.halfHours(tmpHalfHour.hour*2+1) = tmpHalfHour; %add the previous to the day
        tmpHalfHour = halfHour(actualMonth, actualDay, actualHour); %create the new halfHour
        nrOfHalfHours = nrOfHalfHours+1;
    end
    tmpHalfHour.addTrip(newTrip);
    if(not(strcmp(days{daynr}.date,row{2}(1:10)))) %if new day, add it
        daynr = daynr + 1;
        days{daynr} = day(row{2}(1:10));
    end
end
fclose(traincsv);

%% generate empty predicted days
clear estimatedDays;
estimatedDays = cell(1,30);
for i=1:30
    if i <= 15
        monthNr = 4;
        dayNr = i*2;
    else
        monthNr = 5;
        dayNr = i*2-30;
    end
    estimatedDays{i} = day(sprintf('2015-%02d-%02d', monthNr, dayNr));
end

%% add weather data to days
weathercsv = fopen('mol_bubi_dataset/weather_data.csv','r'); % open csv file for reading
fgets(weathercsv); %get rid of the header
dayCount = 1;
estdayCount = 1;
for i=1:(length(days)+30)
    isFirst = true;
    isEstDay = false;
    for j=1:48
        line = fgets(weathercsv);
        if isFirst
            isFirst = false;
            row = strsplit(line, ' ');
            date = strsplit(row{1}, '-');
            isEstDay = ((str2double(date{2}) > 3) && (mod(str2double(date{3}),2) == 0)); %if its 4th or 5th month and even day
            if isEstDay
                estdayCount = estdayCount + 1;
            else
                dayCount = dayCount + 1;
            end
        end
        if isEstDay
            estimatedDays{estdayCount}.halfHours(j).weather = weather(line);
        else
            days{dayCount}.halfHours(j).weather = weather(line);
        end
    end
end
fclose(weathercsv);

%% precalculate given days
clear nnTargets; clear nnInputs;
nnInputs = zeros(3,length(days));
if strcmp(task,'BRP')
    nnTargets = zeros(length(getStationList())*length(getStationList()),nrOfHalfHours);
else %DSDP
    nnTargets = zeros(length(getStationList()),length(days));
end
countTheHHours = 1;
for i=1:length(days)
    for j=1:length(days{i}.halfHours)
        if strcmp(task,'BRP')
            nnTargets(:,countTheHHours) = reshape(days{i}.halfHours(j).getRoutes(),[length(getStationList())*length(getStationList()),1]);
            %days{i}.getTopRoutes();
            countTheHHours = 1 + countTheHHours;
        else
            nnTargets(:,i) = days{i}.getStationDemand();
        end
        nnInputs(1,countTheHHours) = weekday(days{i}.date); %day of week
        nnInputs(2,countTheHHours) = days{i}.halfHours(j).month;
        nnInputs(3,countTheHHours) = days{i}.halfHours(j).day;
        nnInputs(4,countTheHHours) = days{i}.halfHours(j).hour;
    end
end

%% train the neural network

%% neural network estimation
for i=1:30
    input = zeros(4,1);
    input(1) = weekday(estimatedDays{i}.date);
    date = strsplit(estimatedDays{i}.date, '-');
    input(2) = str2double(cell2mat(date(2))); %month
    input(3) = str2double(cell2mat(date(3))); %day
    for hh=1:48
        if strcmp(task,'BRP')
            estimatedDays{i}.halfHours(hh) = halfHour(input(2),input(3),hh*0.5);
            input(4) = hh*0.5;
            estimatedDays{i}.halfHours(hh).routeUsage = reshape(nnHourDef10h(input),[length(getStationList()),length(getStationList())]);
        else
            estimatedDays{i}.stationDemand = dsdpDef6hid(input);
        end
    end
    estimatedDays{i}.getTopRoutes();
end
%% estimate
clear estimatedDays;
estimatedDays = cell(1);
for i=1:30
    if i <= 15
        monthNr = 4;
        dayNr = i*2;
    else
        monthNr = 5;
        dayNr = i*2-30;
    end
    estimatedDays{i} = dayn(sprintf('2015-%02d-%02d', monthNr, dayNr));
    if weekday(estimatedDays{i}.date) == 1 || weekday(estimatedDays{i}.date) == 6 %if it's Sunday or Friday
        estimatedDays{i}.routeUsage = days{90+i}.routeUsage; %copy the previous day
    elseif weekday(estimatedDays{i}.date) == 7 || weekday(estimatedDays{i}.date) == 2 % if it's Saturday or Monday
        estimatedDays{i}.routeUsage = days{91+i}.routeUsage; %copy the next day (Sunday->Saturday, Tuesday->Monday)
    else
        estimatedDays{i}.routeUsage = 0.5*days{90+i}.routeUsage+0.5*days{91+i}.routeUsage;
    end
    estimatedDays{i}.getTopRoutes();
    %estimatedDays{i}.stationDemand = 0.52*days{90+i}.stationDemand + 0.48*days{91+i}.stationDemand;
end

%% print results
outputFile = 'outputtest';
ftmp = fopen(outputFile,'w'); fclose(ftmp); % clear the file
for i = 1:30;
    if strcmp(task,'BRP')
        printTopRoutes(estimatedDays{i},outputFile);
    else
        printStationDemand(estimatedDays{i}, outputFile);
    end
end

%% calculate differences
outputFile = 'BRPdiff.csv';
ftmp = fopen(outputFile,'w'); 
for i=2:length(days)
    diff = dayDifferenceBRP(days{i-1},days{i});
    [DayNumber,DayName] = weekday(days{i}.date, 'long');
    fprintf(ftmp,'%s->%s;%s;%s\n',days{i-1}.date,days{i}.date,DayName,num2str(diff));
end
fclose(ftmp);