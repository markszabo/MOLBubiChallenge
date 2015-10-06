classdef weather
   properties
        time % date and time
        tempm % temperature in C
        hum % humidity in %
        wspdm % wind speed in kph
        wdird % wind direction in degrees
        wdire % wind direction description (ie. SW, NNE)
        pressurem % pressure in mBar
        vism % visibility in Km
        windchillm % wind chill in C
        fog % 1 in case of fog, 0 otherwise
        rain % 1 in case of rain, 0 otherwise
        snow % 1 in case of snow, 0 otherwise
        hail % 1 in case of hail, 0 otherwise
        thunder % 1 in case of thunder, 0 otherwise
   end
   methods
      %function r = roundOff(obj)
      %   r = round([obj.Value],2);
      %end
   end
end