function station = id2station(id)
    stations = getStationList();
    station = stations{id};
end