function stationList = getStationList()
    stationList = ['1010', '1020'];
end

function id = station2id(station)
    stations = getStationList();
    for i=1:length(stations)
        if stations(i) == station
            id = i;
        end
    end
end

function station = id2station(id)
    stations = getStationList();
    station = stations(id);
end