# MOLBubiChallenge
My trials and errors for the MOL Bubi Big Data Challenge (https://dms.sztaki.hu/bubi/)
# Captain's Log
2015-10-05 I registered for the challenge, got my account and datasets, started to write the Matlab code

2015-10-06 First working version to BRP. Algorithm is simple: just copy yesterday's data entirely. Basically I set it up just to test the format, and the calculations. Still got 0.501197526 points, and currently second on the leaderboard (out of 5)!

2015-10-07 New algorithm: get the same day from the previous week (eg Monday for Monday). Not so good, got only 0.470833630 points

2015-10-07 New algorithm: calculate the average of the previous and the next day. Almost 0.1 better with 0.594551395 points!

2015-10-07 First DSDP with the previous algorithm - the average of yesterday and tomorrow. Instant second place with 5.19271 points (here: the less the better)

2015-10-07 DSDP - tried with 0.7*yesterday+0.3*tomorrow. Worse result than with 0.5-0.5: 5.314126654

2015-10-08 DSDP - tried with the opposit: 0.3*yesterday + 0.7*tomorrow, even worse result: 5.380848245

2015-10-08 BRP - tried with 0.7*yesterday+0.3*tomorrow. Worse result than with half-half: 0.570468697

2015-10-09 BRP - tried with 0.3*yesterday+0.7*tomorrow. Worse result: 0.579069766

2015-10-09 DSDP - tried with 0.6*yesterday+0.4*tomorrow, still worse than halfhalf: 5.214784533

(*)2015-10-09 BRP - 0.55*yesterday+0.45*tomorrow, best result sofar: 0.595148889

2015-10-09 DSDP - 0.55*yesterday+0.45*tomorrow, half-half still better: 5.193947030

2015-10-10 BRP - 0.6*yesterday+0.4*tomorrow, worse: 0.589907791

(*)2015-10-10 DSDP - 0.52*yesterday+0.48*tomorrow, slightly better than half-half: 5.190847659

2015-10-11 BRP if Sunday, or Saturday, copy the other weekend day, if Monday copy Tuesday, otherwise half-half: 0.569184803

2015-10-14 BRP Mayor improvement with Neural network! With default configuration and 10 hidden neuron: 0.661506442. Meanwhile I got back to the 4th place, but now 2nd again!
