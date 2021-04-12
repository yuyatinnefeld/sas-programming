proc import datafile = "/folders/myfolders/Data/score_data_miss"
DBMS = xlsx out = scoredata0 replace;
run;

data scoredata1;
set scoredata0;
TotalScore = sum(score1, score2, score3);
AverageScore = mean(score1, score2, score3);
run;

data scoredata2;
set scoredata1;
format AverageScore 5.2;
run;

proc print data = scoredata2;
title "Permanent format for Average Score";
run;

proc print data = scoredata2;
format AverageScore 4.1;
title "Temporary format for Averagescore";
run;

/*create the user-defined formats in the temp lib*/

proc format;
	value $genderf 	'm' = 'Male' 
					'f' = 'Female';
	value asgroup 	0-<60 = 'F'
					60-<70 = 'D'
					70-<80 = 'C'
					80-<90 = 'B'
					90-High = 'A'
					Other = 'Missing';
					
run;

proc print data = scoredata2;
	format gender $genderf. averagescore asgroup.;
	title 'results printed with user-defined formats';
run;


/*create the user-defined formats in the perm lib*/
libname myfmts "/folders/myfolders/formats";
proc format library = myfmts;
	value $genderf 	'm' = 'Male' 
					'f' = 'Female';
	value asgroup 	0-<60 = 'F'
					60-<70 = 'D'
					70-<80 = 'C'
					80-<90 = 'B'
					90-High = 'A'
					Other = 'Missing';
run;

proc format library=myfmts fmtlib;

/*use the user-defined formats in the perm lib*/
libname myfmts "/folders/myfolders/formats";
options fmtsearch=(myfmts work library);

proc print data = scoredata1;
	format gender $genderf. averagescore asgroup.;
run;



