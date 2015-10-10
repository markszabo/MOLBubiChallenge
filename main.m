clear;

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
for i=1:length(days)
    days{i}.getRoutes();
    days{i}.getTopRoutes();
    days{i}.getStationDemand();
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
    %estimatedDays{i}.routeUsage = 0.6*days{90+i}.routeUsage+0.4*days{91+i}.routeUsage;
    %estimatedDays{i}.getTopRoutes();
    estimatedDays{i}.stationDemand = 0.52*days{90+i}.stationDemand + 0.48*days{91+i}.stationDemand;
end

%% print results
outputFile = 'outputtest';
ftmp = fopen(outputFile,'w'); fclose(ftmp); % clear the file
for i = 1:30;
    % printTopRoutes(estimatedDays{i},outputFile);
    printStationDemand(estimatedDays{i}, outputFile);
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