proc import datafile = "/folders/myfolders/Data/score_data_miss999"
DBMS = xlsx out = scoredata0 replace ;
run;

DATA scoredata1;
set scoredata0;
	ARRAY score_var (3) score1 score2 score3;
	DO i = 1 TO 3;
		IF score_var(i) = 999 THEN score_var(i) =.;
	END;

run;

proc print data = scoredata1;
title "missing values are show as periods";
run;

proc print data = scoredata0;
title "missing values are show as 999";
run;