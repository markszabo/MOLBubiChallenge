clear;

task = 'DSDP';
%task = 'BRP';

days = {day('2015-01-01')};

traincsv = fopen('mol_bubi_dataset/train.csv','r'); % open csv file for reading
line = fgets(traincsv); %get rid of the header
while ~feof(traincsv)
    line = fgets(traincsv); % read line by line
    row = strsplit(line,',');
    newTrip = trip(row{1}, row{2}, row{3}, row{4}, strtrim(row{5})); %TODO make it nicer
    if(not(strcmp(days{end}.date,row{2}(1:10)))) %if new day, add it
        days{end+1} = day(row{2}(1:10));
    end
    days{end}.addTrip(newTrip);
end
fclose(traincsv);

%% precalculate given days
clear nnTargets; clear nnInputs;
nnInputs = zeros(3,length(days));
if strcmp(task,'BRP')
    nnTargets = zeros(length(getStationList())*length(getStationList()),length(days));
else %DSDP
    nnTargets = zeros(length(getStationList()),length(days));
end
for i=1:length(days)
    if strcmp(task,'BRP')
        nnTargets(:,i) = reshape(days{i}.getRoutes(),[length(getStationList())*length(getStationList()),1]);
        days{i}.getTopRoutes();
    else
        nnTargets(:,i) = days{i}.getStationDemand();
    end
    nnInputs(1,i) = weekday(days{i}.date); %day of week
    date = strsplit(days{i}.date, '-');
    nnInputs(2,i) = str2double(cell2mat(date(2))); %month
    nnInputs(3,i) = str2double(cell2mat(date(3))); %day
end

%% train the neural network

%% neural network estimation
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
    estimatedDays{i} = day(sprintf('2015-%02d-%02d', monthNr, dayNr));
    input = zeros(3,1);
    input(1) = weekday(estimatedDays{i}.date);
    date = strsplit(estimatedDays{i}.date, '-');
    input(2) = str2double(cell2mat(date(2))); %month
    input(3) = str2double(cell2mat(date(3))); %day
    if strcmp(task,'BRP')
        estimatedDays{i}.routeUsage = reshape(nnDef50hidden(input),[length(getStationList()),length(getStationList())]);
        estimatedDays{i}.getTopRoutes();
    else
        estimatedDays{i}.stationDemand = dsdpDef6hid(input);
    end
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
    estimatedDays{i} = day(sprintf('2015-%02d-%02d', monthNr, dayNr));
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