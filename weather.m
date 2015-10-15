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
       function w = weather(line)
           %line = 2015-01-01 00:00:00,-12.0,85,5.6,0,Variable,1037,5.0,-15.5,0,0,0,0,0
           if ischar(line)
               row=strsplit(line,',');
               w.time = row{1};
               w.tempm = str2double(row{2});
               w.hum = str2double(row{3});
               w.wspdm = str2double(row{4});
               w.wdird = str2double(row{5});
               w.wdire = row{6};
               w.pressurem = str2double(row{7});
               w.vism = str2double(row{8});
               w.windchillm = str2double(row{9});
               w.fog = str2double(row{10});
               w.rain = str2double(row{11});
               w.snow = str2double(row{12});
               w.hail = str2double(row{13});
               w.thunder = str2double(row{14});
           end
       end
   end
end