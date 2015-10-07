clear;

days = {day('2015-01-01')};

traincsv = fopen('mol_bubi_dataset/train.csv','r'); % open csv file for reading
line = fgets(traincsv); %get rid of the header
while ~feof(traincsv)
    line = fgets(traincsv); % read line by line
    row = strsplit(line,',');
    newTrip = trip(row{1}, row{2}, row{3}, row{4}, strtrim(row{5})); %TODO make it nicer
    %firstday.addTrip(newTrip);
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
    estimatedDays{i}.routeUsage = 0.5*days{90+i}.routeUsage+0.5*days{91+i}.routeUsage;
    estimatedDays{i}.getTopRoutes();
end

%% print results
outputFile = 'outputtest';
ftmp = fopen(outputFile,'w'); fclose(ftmp); % clear the file
for i = 1:30;
    printTopRoutes(estimatedDays{i},outputFile);
end