classdef halfHour < handle %needed to enable functions to change the properties of the class 
    properties
        weather %weather data
        trips
        routeUsage
        month
        day
        hour % 14.5 for 2:30pm
    end
    methods
        function h = halfHour(m, d, hh)
            h.trips = trip.empty;
            %h.weather = weather.empty; not sure if needed
            h.month = m;
            h.day = d;
            h.hour = hh;
        end
        
        function addTrip(obj, t)
            obj.trips(length(obj.trips)+1) = t;
        end

      function r = getRoutes(obj)
        if(not(isempty(obj.routeUsage))) %if it was calculated perviously, just return it
            r = obj.routeUsage;
        else %if it wasn't calculated yet, do it now
            routeUse = zeros(length(getStationList()),length(getStationList())); % first coord: from where, second: to where
            for i=1:length(obj.trips)
                routeUse(station2id(obj.trips(i).start_location), station2id(obj.trips(i).end_location)) = 1 + ...
                            routeUse(station2id(obj.trips(i).start_location), station2id(obj.trips(i).end_location));
            end
            obj.routeUsage = routeUse;
            r = routeUse;
        end
      end
    end
    
end