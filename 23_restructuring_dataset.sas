/*convert one obs > many obs*/


proc import datafile="/folders/myfolders/data/score_data_id"
DBMS=xlsx out=one_to_many replace;
run;

libname stuscore "/folders/myfolders";

data stuscore.one_to_many;
	set one_to_many;
	array score(3) score1 score2 score3;
	do i = 1 to 3;
		all_score = score(i);
		if all_score ne . then output;
	end;
	keep name stu_id all_score i;
run;

proc print data = one_to_many;
title 'one obs per student';
run;

proc print data = stuscore.one_to_many;
title 'several obs per student';
run;


/*convert many obs > one obs*/

proc sort data=stuscore.one_to_many out=many_to_one;
	by stu_id i;
run;

data stuscore.many_to_one;
	set scd_id0;
	by stu_id i;
	array score(3);
	retain score1-score3;
	if first.stu_id then call missing(of score1-score3);
	score(i) = all_score;
	if last.stu_id then output;
	keep name stu_id score1-score3;
run;


proc print data = stuscore.one_to_many;
title 'several obs per student';
run;
	
	
proc print data = stuscore.many_to_one;
title 'one obs per student';
run;


/*proc transpose*/

/*
PROC TRANSPOSE DATA = old-data-set OUT = new-data-set;
BY variable-list;
ID variable-list;
VAR variable-list;
*/


proc import datafile="/folders/myfolders/data/score_data_id"
DBMS=xlsx out=one_per replace;
run;

proc sort data = one_per; by stu_id; run;

proc transpose 
data=one_per out=many_per;
by stu_id;
var score1 - score3;
run;


proc transpose 
data=one_per out=many_per_final (
	rename = 
		(col1 = all_score _name_ = score_type)
		drop = _label_
		where=(all_score ne .)
	);
by stu_id;
var score1 - score3;
run;

proc print data = one_per;
title 'single obs per student';
run;

proc print data = many_per_final;
title 'multiple obs per student';
run;




