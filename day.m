classdef day < handle %needed to enable functions to change the properties of the class 
   properties
      date % date in 2015-05-16 format
      trips % array of trips made on the day
      weather % array of the weather on the whole day
      routeUsage %all routes
      topRoutes %top 100 routes
   end
   methods
      function d = day(dayDate)
           d.trips = trip.empty;
           d.date = dayDate;
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
      
      function top = getTopRoutes(obj) %get top 100 routes in this format: 0201-0202,4
          if(not(isempty(obj.topRoutes)))
              top = topRoutes;
          else
              topNrs = zeros(100);
              top = repmat({''}, 100, 1);
              for i = 1:size(obj.routeUsage,1)
                  for j = 1:size(obj.routeUsage,2)
                      if(obj.routeUsage(i,j) > 0) %if 0, just skip
                          for t = 1:length(topNrs)
                              if(topNrs(t) < obj.routeUsage(i,j))
                                  topNrs = [topNrs(1:t-1) obj.routeUsage(i,j) topNrs(t:99)];
                                  newTop = strcat(id2station(i),'-',id2station(j),',',num2str(obj.routeUsage(i,j)));
                                  top = {top{1:t-1} newTop top{t:99}};
                                  break;
                              end
                          end
                      end
                  end
              end
              obj.topRoutes = top;
          end
      end
   end
end