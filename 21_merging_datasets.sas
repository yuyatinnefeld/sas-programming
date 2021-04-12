/* ONE TO ONE MERGE */


/*
DATA output-SAS-data-set;
	SET SAS-data-set-1;
	SET SAS-data-set-2;
RUN;
*/

proc import datafile="/folders/myfolders/data/score_data_id_partial"
DBMS=xlsx out=scoredata_p replace;
run;

proc import datafile="/folders/myfolders/data/score_data_id"
DBMS=xlsx out=scoredata replace;
run;

data one_to_one;
set scoredata_p;
set scoredata;
run;

proc print data = one_to_one;
title 'one to one merge';
run;

proc print data = scoredata_p;
title 'dataset1 - scoredata_p';
run;

proc print data = scoredata;
title 'dataset2 - scoredata';
run;

/* CONCATENATING */

/*
DATA output-SAS-data-set;
	SET SAS-data-set-1 SAS-data-set-2;
RUN;
*/

data concat;
set scoredata_p scoredata;
run;

proc print data = concat;
title 'concatenatint';
run;

/* APPENDING */

/*
PROC APPEND BASE=SAS-data-set1
	DATA= SAS-data-set2;
RUN;

Using FORCE option for the unlike-structured Dataset

PROC APPEND BASE=SAS-data-set1
	DATA= SAS-data-set2 FORCE;
RUN;
*/


proc append base = scoredata_p
	data = scoredata force;
run;


proc print data = scoredata_p;
title 'append';
run;

/* INTERLEAVING */

/*
DATA output-SAS-data-set;
	SET SAS-data-set1 SAS-dataset-2;
	BY variable(s);
RUN;
*/

/*acending*/

proc sort data = scoredata_p; by stu_id; run;

proc sort data = scoredata; by stu_id; run;


data interleave;
set scoredata_p scoredata;
by stu_id;
run;

proc print data=interleave; 
title 'interleaving';
run;

/* MATCH-MERGING */

/*
DATA output-SAS-data-set;
	MERGE SAS-data-set1 SAS-dataset-2;
	BY <DESCENDING >variable(s);
RUN;
*/


proc import datafile="/folders/myfolders/data/score_data_id_partial"
DBMS=xlsx out=scoredata_p replace;
run;

proc import datafile="/folders/myfolders/data/score_data_id"
DBMS=xlsx out=scoredata replace;
run;


proc sort data = scoredata_p; by stu_id; run;
proc sort data = scoredata; by stu_id; run;


DATA MMA;
MERGE scoredata_p scoredata;
by stu_id;
run;


proc print data = MMA;
title 'match-merging ascending';
run;

proc print data = scoredata_p;
title 'dataset1 - scoredata_p';
run;

proc print data = scoredata;
title 'dataset2 - scoredata';
run;




