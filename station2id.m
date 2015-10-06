function id = station2id(station)
    stations = getStationList();
    for i=1:length(stations)
        if stations{i} == station
            id = i;
        end
    end
end