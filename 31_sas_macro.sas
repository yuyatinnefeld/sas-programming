/* a. macro variables */

%let state = NRW;
title 'data for &state';


/* b. macros */
%macro print;
	proc print data = score_data_nrw;
	title 'input data';
	run;
%mend print;


%macro data_info;
	score_data_nrw
%mend data_info;

title 'score means form %data_info';

proc import datafile="/folders/myfolders/data/score_data_id"
DBMS= xlsx out = score_data replace;
run;

%let score_yt = score1;

proc means data = score_data  MAXDEC = 1 n max min mean;
var &score_yt;
title 'mean for &score_yt';
run;
