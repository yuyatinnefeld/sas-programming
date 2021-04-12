/*
3 Types of Merging
	- one to one merge
	- one to many merge
	- many to many merge
*/


/* one to one merge */

proc import datafile="/folders/myfolders/data/score_data_id_gender_only"
DBMS=xlsx out=scoredata_g replace;
run;

proc import datafile="/folders/myfolders/data/score_data_id_no_gender"
DBMS=xlsx out=scoredata replace;
run;

proc sort data = scoredata_g; by stu_id; run;
proc sort data = scoredata; by stu_id; run;

data one_to_one;
merge scoredata_g scoredata;
by stu_id;
run;

proc print data = one_to_one;
title 'one to one match merging';
run;

proc print data = scoredata_g;
title 'dataset1 - score data with gender info';
run;

proc print data = scoredata;
title 'dataset2 - score data without gender info';
run;

/* one to many merge */

proc import datafile="/folders/myfolders/data/score_data_id_gender_only_dup" /* dublicate */
DBMS=xlsx out=scoredata_g_dup replace;
run;

proc import datafile="/folders/myfolders/data/score_data_id_no_gender"
DBMS=xlsx out=scoredata replace;
run;

proc sort data = scoredata_g_dup; by stu_id; run;
proc sort data = scoredata; by stu_id; run;

data one_to_many;
merge scoredata_g_dup scoredata;
by stu_id;
run;

proc print data = one_to_many;
title 'one to many match merging';
run;

proc print data = scoredata_g_dup;
title 'dataset1 - score data with gender info (dublicate)';
run;

proc print data = scoredata;
title 'dataset2 - score data without gender info';
run;


/* 
renaming variables

General form RENAME = data set option:
(RENAME=(old-variable-name=new-variable-name))

 */

proc import datafile="/folders/myfolders/data/score_data_id_partial_score4_genderNA"
DBMS=xlsx out=scoredata_p_na replace;
run;

proc import datafile="/folders/myfolders/data/score_data_id"
DBMS=xlsx out=scoredata replace;
run;

proc sort data = scoredata_p_na; by stu_id; run;
proc sort data = scoredata; by stu_id; run;

data MMA;
merge scoredata scoredata_p_na;
by stu_id;
run;
 
proc print data = MMA;
title 'match merging gender missing';
run;

proc print data = scoredata_p_na;
title 'dataset1 - score data with gender info missing';
run;

proc print data = scoredata;
title 'dataset2 - score data without gender info';
run;

/* drop and keep */

proc import datafile="/folders/myfolders/data/score_data_id_partial_score4"
DBMS=xlsx out=scoredata_p replace;
run;


data MMA2 (drop = stu_id);
merge scoredata_p(in = A) scoredata(in = B drop = score3);
by stu_id;
if A = 1 and B = 1;
run;

 
proc print data = MMA2;
title 'match merging observations';
run;

proc print data = scoredata_p;
title 'dataset1 - score data partial';
run;

proc print data = scoredata;
title 'dataset2 - score data';
run;

