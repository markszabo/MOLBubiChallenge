function printStationDemand(d, file)
    f = fopen(file,'a');
    for i = 1:length(d.stationDemand)
        fprintf(f,'%s,%s,%s\n',d.date,id2station(i),num2str(d.stationDemand(i)));
    end
    fclose(f);
end