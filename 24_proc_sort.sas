/*sorting data*/

/*
PROC SORT;
	BY variable-list;

PROC SORT DATA=input-data OUT=output-data;

NODUPKEY > for eliminate any dublicate observations

PROC SORT DATA = input-data OUT=output-data NODUPKEY DUPOUT= extraobs;
*/

proc import datafile="/folders/myfolders/data/score_data_miss"
DBMS=xlsx out=scoredata0 replace;
run;

data scoredata1;
set scoredata0;
	total_score = sum(score1, score2, score3);
	avg_score = mean(score1, score2, score3);
format avg_score 5.2;
run;

proc sort data=scoredata1 out=scoredata2;
by descending total_score;
run;

proc sort data=scoredata1 out=scoredata3;
by gender descending avg_score;
run;

proc print data=scoredata2; run;
proc print data=scoredata3; run;

proc sort data=scoredata1 out=scoredata4 nodupkey dupout = extraobs;
by gender;
run;

proc print data=scoredata3; run;

proc print data=scoredata4;
title "sort by gender with NODUPKEY option";
run;

proc print data=extraobs;
title "sort by gender with DUPOUT = extraobs";
run;
