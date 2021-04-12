proc import file = "/folders/myfolders/Data/score_data_miss777"
DBMS = xlsx out = scoredata0 replace ;
run;

DATA scoredata1;
set scoredata0;
	ARRAY sc (3) score1 score2 score3;
		ARRAY new (3) ns1 ns2 ns3;
		DO i = 1 TO 3;
			IF sc(i) = 777 THEN new(i) =.;
			ELSE IF sc(i) NE 777 THEN new(i) = sc(i);
		END;
		
	avg_score = mean(ns1, ns2, ns3);
	run;

proc print data = scoredata1;
run;
