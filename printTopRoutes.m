function printTopRoutes(d, file)
    f = fopen(file,'a');
    for i = 1:length(d.topRoutes)
        fprintf(f,'%s,%s\n',d.date,d.topRoutes{i});
    end
    fclose(f);
end