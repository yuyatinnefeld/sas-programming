proc import datafile = "/folders/myfolders/Data/score_data_miss"
DBMS = xlsx out = scoredata0 replace;
run;

data scoredata1;
set scoredata0;
	label 	score1 = 'Math Score'
			score2 = 'Science Score'
			score3 = 'English Score';
run;

proc print data = scoredata1 label;
run;

proc print data = scoredata1 label;
label name = 'student name';
run;

proc means data = scoredata1 label split = '*';
var score1;
run;


proc print data = scoredata1 label split = '*';
label name = 'student * name';
run;
