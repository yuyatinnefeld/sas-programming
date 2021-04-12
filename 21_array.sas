/*
Create One Dim Array
ARRAY array_name {dimension}

array of char variables => +$
ARRAY firstname{5} $24;

*/


data array_example;
array simple{3} red green yellow;
do i = 1 to 3;
	simple(i) = 222;
end;
run;


proc import datafile="/folders/myfolders/data/score_data_miss999"
DBMS=xlsx out=scoredata0 replace;
run;

data scoredata1 (drop = i);
set scoredata0;
	ARRAY score_list (3) score1 score2 score3;
	DO i = 1 TO 3;
		IF score_list(i) = 999 THEN score_list(i) =.;
	END;
avg_score = mean(score1, score2, score3);
run;


data scoredata2 (drop=i);
set scoredata1;
	ARRAY score_list (3) score1 score2 score3;
	ARRAY score_diff(3);
	DO i = 1 TO 3;
		score_diff(i) = score_list(i) - avg_score;
	END;
run;

/*
Assign One Dim Array
*/

/* check avg val */
proc means data = scoredata1;
var score1 score2 score3;
run;


data scoredata2 (drop=i);
set scoredata1;
	ARRAY score_list(3) score1 score2 score3;
	ARRAY avg(3) (79.50 81.90 89.80);
	ARRAY score_diff(3);
	DO i = 1 TO 3;
		score_diff(i) = score_list(i) - avg(i);
	END;
run;

proc print data=scoredata2; run;

data scoredata2 (drop=i);
set scoredata1;
	ARRAY score_list(3) score1 score2 score3;
	ARRAY avg(3) _TEMPORARY_(79.5 81.9 89.8);
	ARRAY score_diff(3);
	DO i = 1 TO 3;
		score_diff(i) = score_list(i) - avg(i);
	END;
run;

proc print data=scoredata2; run;

/*
Two/Multi Dim Array
*/
proc import datafile="/folders/myfolders/data/monthly"
DBMS=xlsx out=monthly0 replace;
run;

data quarters(drop=i j);
set monthly0;
	array m(4, 3) month1-month12;
	array Qtr(4);
	do i = 1 to 4;
		Qtr(i)=0;
		do j = 1 to 3;
			Qtr(i)+m(i,j);
		end;
	end;

run;


data check_data;
set quarters;
total_month = sum(of month1-month12);
total_quarter = sum(of Qtr1-Qtr4);
run;


proc print data = check_data (keep = year total_quarter Qtr1 - Qtr4); run;



