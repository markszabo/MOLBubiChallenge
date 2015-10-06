classdef trip
   properties
      bicycle_id % unique ID of the bicycle
      start_time % start time of the trip
      end_time % end time of the trip
      start_location % source station ID
      end_location % target station ID
   end
   methods
      %function r = roundOff(obj)
      %   r = round([obj.Value],2);
      %end
      function obj = trip(id,st,et,sl,el)
        obj.bicycle_id = id;
        obj.start_time = st;
        obj.end_time = et;
        obj.start_location = sl;
        obj.end_location = el;
      end
   end
end