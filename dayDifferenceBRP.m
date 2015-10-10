function diff = dayDifferenceBRP(day1, day2)
  diff = 0;
  tmp = strsplit(day1.topRoutes{100},',');
  limit = 0;
  if(length(tmp)>1) %sometimes there are less than 100 element in the list
      limit = str2double(tmp(2));
  end
  for i = 1:numel(day1.routeUsage)
      if(day1.routeUsage(i) >= limit) %if it's in the top 100 route
          diff = diff + abs(day1.routeUsage(i) - day2.routeUsage(i));
      end
  end
end