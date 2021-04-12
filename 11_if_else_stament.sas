proc import datafile = "/folders/myfolders/Data/score_data_miss"
DBMS = xlsx out = scoredata0 replace ;
run;

DATA scoredata1;
	set scoredata0;
	TotalScore_func = sum (score1, score2, score3);
	AverageScore_func = mean (score1, score2, score3);
run;

proc print data = scoredata1;

DATA scoredata1_if_else;
	set scoredata1;
	IF gender = 'f' THEN gender_num = 0;
	ELSE IF gender = 'm' THEN gender_num = 1;
	ELSE gender_num = . ;
	
	IF score1 NE . AND score2 NE . AND score3 NE . THEN take = 'complete';
	ELSE take = 'incomplete';
	
	IF AverageScore_func >= 90 THEN DO;
		grade = 'A';
		pass = 'pass';
	END;
	ELSE IF AverageScore_func >= 80 THEN DO;
		grade = 'B';
		pass = 'pass';
	END;
	ELSE IF AverageScore_func >= 70 THEN DO;
		grade = 'C';
		pass = 'pass';
	END;
	ELSE DO;
		grade = 'D';
		pass = 'fail';
	END;

run;

	