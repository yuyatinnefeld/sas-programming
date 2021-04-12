proc import datafile = "/folders/myfolders/Data/score_data"
DBMS = xlsx out = scoredata0 replace ;
run;

DATA scoredata1_if_then;
	set scoredata0;
	TotalScore_func = sum (score1, score2, score3);
	AverageScore_func = mean (score1, score2, score3);
	IF gender = 'm' THEN gender_num = 1;
	IF gender = 'f' AND AverageScore_func >= 85 THEN smart_female = 1;
	IF gender = 'm' AND AverageScore_func >= 85 THEN smart_male = 1;
	IF score1 NE . AND score2 NE . AND score3 NE . THEN take = 'complete';
	IF AverageScore_func >= 90 THEN DO;
		grade = 'A';
		pass = 'pass';
	END;

run;

proc print data = scoredata1_if_then;