/*
PROC MEANS options;

options:
MAXDEC = n
MISSING
MAX
MIN
MEAN
MEDIAN
MODE
N
NMISS
RANGE
STDDEV
SUM
*/

proc import datafile="/folders/myfolders/data/score_data_miss"
DBMS=xlsx out=scoredata0 replace;
run;

data scoredata1;
set scoredata0;
	total_score = sum (score1, score2, score3);
	avg_score = mean(score1, score2, score3);
run;

proc means data = scoredata1 maxdec = 1 n mean max min;
	var score1 score2 score3 avg_score;
	title 'summary of score';
run;

/*by statement*/
proc sort data=scoredata1 out=scoredata2;
by gender;
run;

proc means data=scoredata2 maxdec = 1 n mean max min;
	by gender;
	var score1 score2 score3 avg_score;
	title 'summary of scored by gender using by statement'
run;

/*class statement*/

proc means data=scoredata1 maxdec = 1 n mean max min median;
	class gender;
	var score1 score2 score3 avg_score;
	title 'summary of scores by gender using class statement'
run;


proc means data=scoredata1 maxdec = 1 missing n mean max min median;
	class gender;
	var score1 score2 score3 avg_score;
	title 'summary of scores by gender using class statement with missing'
run;






