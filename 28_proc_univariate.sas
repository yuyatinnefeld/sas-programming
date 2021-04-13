
proc import datafile="/folders/myfolders/data/score_data_miss"
DBMS=xlsx out=scoredata0 replace;
run;


data scoredata1;
   set scoredata0; 
    total_score = sum (score1, score2, score3);
	avg_score = mean (score1, score2, score3);
run;

proc univariate data = scoredata1;
	var avg_score;
	title 'summary of average score';
run;

proc sort data = scoredata1 out= scoredata2;
by gender;
run;

proc univariate data = scoredata2;
	var avg_score;
	by gender;
	title 'summary of average scores by gender'
run;