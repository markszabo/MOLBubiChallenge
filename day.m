classdef day < handle %needed to enable functions to change the properties of the class 
   properties
      date % date in 2015-05-16 format
      %trips % array of trips made on the day
      %weather % array of the weather on the whole day
      routeUsage %all routes
      topRoutes %top 100 routes
      stationDemand
      halfHours
   end
   methods
      function d = day(dayDate)
           d.date = dayDate;
           ddd = strsplit(dayDate,'-');
           d.halfHours = halfHour.empty;
           for i=1:48
               d.halfHours(i) = halfHour(ddd{2},ddd{3},(i-1)*0.5);
           end
      end
      
      function addHalfHour(obj, h)
          obj.halfHours(length(obj.halfHours)+1) = h;
      end
      
      function rUsage = getRoutesFromHalfHours(obj)
          %summarize the halfHour route usages
          obj.routeUsage = zeros(length(getStationList()));
          for i = 1:length(obj.halfHours)
             obj.routeUsage = obj.routeUsage + obj.halfHours(i).getRoutes();
          end
          rUsage = obj.routeUsage;
      end
      
      function top = getTopRoutes(obj) %get top 100 routes in this format: 0201-0202,4
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
      
      function demand = getStationDemand(obj)
          if(not(isempty(obj.stationDemand)))
              demand = obj.stationDemand;
          else
              stationList = getStationList();
              stationState = zeros(1,length(stationList));
              demand = zeros(1,length(stationList));
              for i=1:length(obj.trips)
                  stationState(station2id(obj.trips(i).start_location)) = ...
                      stationState(station2id(obj.trips(i).start_location)) + 1;
                  stationState(station2id(obj.trips(i).end_location)) = ...
                      stationState(station2id(obj.trips(i).end_location)) - 1;
                  if(stationState(station2id(obj.trips(i).start_location)) > demand(station2id(obj.trips(i).start_location)))
                      demand(station2id(obj.trips(i).start_location)) = stationState(station2id(obj.trips(i).start_location));
                  end
              end
              obj.stationDemand = demand;
          end
      end
   end
end