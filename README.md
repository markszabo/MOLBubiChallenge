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

2015-10-09 BRP - 0.55*yesterday+0.45*tomorrow, best result sofar: 0.595148889

2015-10-09 DSDP - 0.55*yesterday+0.45*tomorrow, half-half still better: 5.193947030

2015-10-10 BRP - 0.6*yesterday+0.4*tomorrow, worse: 0.589907791

2015-10-10 DSDP - 0.52*yesterday+0.48*tomorrow, slightly better than half-half: 5.190847659

2015-10-11 BRP if Sunday, or Saturday, copy the other weekend day, if Monday copy Tuesday, otherwise half-half: 0.569184803

(*)2015-10-14 BRP Mayor improvement with Neural network! With default configuration and 10 hidden neuron: 0.661506442. Meanwhile I got back to the 4th place, but now 2nd again!

2015-10-14 BRP Tried with Bayesian algorithm and 15 hidden neuron. Worse result: 0.653287459

2015-10-14 BRP default algorithm and 50 hidden neuron. Slower, and the result is worse: 0.645285654

(*)2015-10-14 DSDP default neural network algorithm with 10 hidden neuron, best result sofar: 4.487365284

2015-10-14 DSDP scaled algorithm, 10 hidden neuron, worse result: 4.493603817

2015-10-14 DSDP default algorithm, 6 hidden neuron, worse result: 4.753790279

2015-10-15 BRP I separated every day into halfhours and run neural network for them (def algo, 10 hidden). Slightly worse result than before: 0.641336429

2015-10-17 BRP I mixed the halfhours back to days, and used some data from the weather of the day as input. Worse result: 0.651494714

2015-10-17 BRP same as before just with Bayesian method and 12 hidden neuron (for the 12 inputs). Slightly better result: 0.656297313

2015-10-17 BRP same as before just def algo, 24 hidden neuron. Slightly better: 0.658004536

2015-10-18 DSDP previous input was implemented for DSDP. NN with 24 hidden neuron and default algorithm. Worse: 5.458809967

2015-10-18 DSDP same as before just 12 neuron (12 input). Getting better: 4.617493597

2015-10-18 DSDP same as before just 14 neuron. Slightly better: 4.592675851
