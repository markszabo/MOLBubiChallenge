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
dayCount = 0;
estdayCount = 0;
for i=1:(length(days)+30)
    isFirst = true;
    isEstDay = false;
    j = 1;
    while j <= 48
        line = fgets(weathercsv);
        row = strsplit(line, ' ');
        date = strsplit(row{1}, '-'); % date = {2015, 02, 18}
        linetime = strsplit(row{2}, ':'); % time = {12, 35, 10} for 12:35:10
        linehour = str2double(linetime{1}) + 0.5*(str2double(linetime{2}) >= 30);
        if isFirst
            isFirst = false;
            isEstDay = ((str2double(date{2}) > 3) && (mod(str2double(date{3}),2) == 0)); %if its 4th or 5th month and even day
            if isEstDay
                estdayCount = estdayCount + 1;
            else
                dayCount = dayCount + 1;
            end
        end
        if isEstDay
            while estimatedDays{estdayCount}.halfHours(j).hour ~= linehour
                estimatedDays{estdayCount}.halfHours(j).weather = estimatedDays{estdayCount}.halfHours(j-1).weather;
                j = j+1; %sometimes data for some hours are missing, so copy the previous one
            end
            estimatedDays{estdayCount}.halfHours(j).weather = weather(line);
        else
            while days{dayCount}.halfHours(j).hour ~= linehour
                days{dayCount}.halfHours(j).weather = days{dayCount}.halfHours(j-1).weather;
                j = j+1;
            end
            days{dayCount}.halfHours(j).weather = weather(line);
        end
        j = j+1;
    end
end
fclose(weathercsv);

%% precalculate given days
clear nnTargets; clear nnInputs;
nnInputs = zeros(12,length(days));
if strcmp(task,'BRP')
    nnTargets = zeros(length(getStationList())*length(getStationList()),length(days));
else %DSDP
    nnTargets = zeros(length(getStationList()),length(days));
end
for i=1:length(days)
    if strcmp(task,'BRP')
        days{i}.getRoutesFromHalfHours();
        nnTargets(:,i) = reshape(days{i}.routeUsage,[length(getStationList())*length(getStationList()),1]);
    else
        nnTargets(:,i) = days{i}.getStationDemand();
    end
    nnInputs(1,i) = weekday(days{i}.date); %day of week
    nnInputs(2,i) = days{i}.halfHours(1).month;
    nnInputs(3,i) = days{i}.halfHours(1).day;

    nnInputs(4,i) = days{i}.halfHours(10).weather.tempm;
    nnInputs(5,i) = days{i}.halfHours(20).weather.tempm;
    nnInputs(6,i) = days{i}.halfHours(30).weather.tempm;
    nnInputs(7,i) = days{i}.halfHours(40).weather.tempm;
    
    nnInputs(8,i) = days{i}.halfHours(1).weather.rain + days{i}.halfHours(2).weather.rain + days{i}.halfHours(3).weather.rain + days{i}.halfHours(4).weather.rain + days{i}.halfHours(5).weather.rain + days{i}.halfHours(6).weather.rain + days{i}.halfHours(7).weather.rain + days{i}.halfHours(8).weather.rain + days{i}.halfHours(9).weather.rain + days{i}.halfHours(10).weather.rain;
    nnInputs(9,i) = days{i}.halfHours(11).weather.rain + days{i}.halfHours(12).weather.rain + days{i}.halfHours(13).weather.rain + days{i}.halfHours(14).weather.rain + days{i}.halfHours(15).weather.rain + days{i}.halfHours(16).weather.rain + days{i}.halfHours(17).weather.rain + days{i}.halfHours(18).weather.rain + days{i}.halfHours(19).weather.rain + days{i}.halfHours(20).weather.rain;
    nnInputs(10,i) = days{i}.halfHours(21).weather.rain + days{i}.halfHours(22).weather.rain + days{i}.halfHours(23).weather.rain + days{i}.halfHours(24).weather.rain + days{i}.halfHours(25).weather.rain + days{i}.halfHours(26).weather.rain + days{i}.halfHours(27).weather.rain + days{i}.halfHours(28).weather.rain + days{i}.halfHours(29).weather.rain + days{i}.halfHours(30).weather.rain;
    nnInputs(11,i) = days{i}.halfHours(31).weather.rain + days{i}.halfHours(32).weather.rain + days{i}.halfHours(33).weather.rain + days{i}.halfHours(34).weather.rain + days{i}.halfHours(35).weather.rain + days{i}.halfHours(36).weather.rain + days{i}.halfHours(37).weather.rain + days{i}.halfHours(38).weather.rain + days{i}.halfHours(39).weather.rain + days{i}.halfHours(40).weather.rain; 
    nnInputs(12,i) = days{i}.halfHours(41).weather.rain + days{i}.halfHours(42).weather.rain + days{i}.halfHours(43).weather.rain + days{i}.halfHours(44).weather.rain + days{i}.halfHours(45).weather.rain + days{i}.halfHours(46).weather.rain + days{i}.halfHours(47).weather.rain + days{i}.halfHours(48).weather.rain;    
%     nnInputs(6,i) = days{i}.halfHours(j).weather.hum;
%     nnInputs(7,i) = days{i}.halfHours(j).weather.rain;
%     nnInputs(8,i) = days{i}.halfHours(j).weather.wspdm;
%     nnInputs(9,i) = days{i}.halfHours(j).weather.vism;
%     nnInputs(10,i) = days{i}.halfHours(j).weather.windchillm;
%     nnInputs(11,i) = days{i}.halfHours(j).weather.thunder;
end

%% train the neural network

%% neural network estimation
for i=1:30
    input = zeros(12,1);
    input(1) = weekday(estimatedDays{i}.date);
    if strcmp(task,'BRP')
        input(2) = estimatedDays{i}.halfHours(1).month;
        input(3) = estimatedDays{i}.halfHours(1).day;

        input(4) = estimatedDays{i}.halfHours(10).weather.tempm;
        input(5) = estimatedDays{i}.halfHours(20).weather.tempm;
        input(6) = estimatedDays{i}.halfHours(30).weather.tempm;
        input(7) = estimatedDays{i}.halfHours(40).weather.tempm;

        input(8) = estimatedDays{i}.halfHours(1).weather.rain + estimatedDays{i}.halfHours(2).weather.rain + estimatedDays{i}.halfHours(3).weather.rain + estimatedDays{i}.halfHours(4).weather.rain + estimatedDays{i}.halfHours(5).weather.rain + estimatedDays{i}.halfHours(6).weather.rain + estimatedDays{i}.halfHours(7).weather.rain + estimatedDays{i}.halfHours(8).weather.rain + estimatedDays{i}.halfHours(9).weather.rain + estimatedDays{i}.halfHours(10).weather.rain;
        input(9) = estimatedDays{i}.halfHours(11).weather.rain + estimatedDays{i}.halfHours(12).weather.rain + estimatedDays{i}.halfHours(13).weather.rain + estimatedDays{i}.halfHours(14).weather.rain + estimatedDays{i}.halfHours(15).weather.rain + estimatedDays{i}.halfHours(16).weather.rain + estimatedDays{i}.halfHours(17).weather.rain + estimatedDays{i}.halfHours(18).weather.rain + estimatedDays{i}.halfHours(19).weather.rain + estimatedDays{i}.halfHours(20).weather.rain;
        input(10) = estimatedDays{i}.halfHours(21).weather.rain + estimatedDays{i}.halfHours(22).weather.rain + estimatedDays{i}.halfHours(23).weather.rain + estimatedDays{i}.halfHours(24).weather.rain + estimatedDays{i}.halfHours(25).weather.rain + estimatedDays{i}.halfHours(26).weather.rain + estimatedDays{i}.halfHours(27).weather.rain + estimatedDays{i}.halfHours(28).weather.rain + estimatedDays{i}.halfHours(29).weather.rain + estimatedDays{i}.halfHours(30).weather.rain;
        input(11) = estimatedDays{i}.halfHours(31).weather.rain + estimatedDays{i}.halfHours(32).weather.rain + estimatedDays{i}.halfHours(33).weather.rain + estimatedDays{i}.halfHours(34).weather.rain + estimatedDays{i}.halfHours(35).weather.rain + estimatedDays{i}.halfHours(36).weather.rain + estimatedDays{i}.halfHours(37).weather.rain + estimatedDays{i}.halfHours(38).weather.rain + estimatedDays{i}.halfHours(39).weather.rain + estimatedDays{i}.halfHours(40).weather.rain; 
        input(12) = estimatedDays{i}.halfHours(41).weather.rain + estimatedDays{i}.halfHours(42).weather.rain + estimatedDays{i}.halfHours(43).weather.rain + estimatedDays{i}.halfHours(44).weather.rain + estimatedDays{i}.halfHours(45).weather.rain + estimatedDays{i}.halfHours(46).weather.rain + estimatedDays{i}.halfHours(47).weather.rain + estimatedDays{i}.halfHours(48).weather.rain;
        estimatedDays{i}.routeUsage = reshape(nnHW24hid(input),[length(getStationList()),length(getStationList())]);
    else
        estimatedDays{i}.stationDemand = dsdpDef6hid(input);
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