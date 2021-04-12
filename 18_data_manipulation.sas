/*
SCAN 		extract words through the delimiters
SUBSTR 		extract words through the position
TRIM		concatenate
CATX		concatenate
INDEX		position
FIND		search
UPPERCASE	uppercase
LOWCASE		lowercase
PROPCASE	propercase
TRANWRD		replace or remove with the pattern
INT			retrun int val
ROUND		round val
*/


/*
SCAN(arg, n, 'delimiters') 
*/

proc import datafile = "/folders/myfolders/data/chara_data"
DBMS=xlsx out=scoredata0 replace;
run;

data scoredata1;
set scoredata0;
last_name = SCAN(full_name, 1, ',: '); /*3 delimiters , : and space */
first_name = SCAN(full_name, 2, ',: ');
run;

proc print data=scoredata1; run;

/*
SUBSTR(arg, pos, n) 
*/

proc import datafile = "/folders/myfolders/data/chara_data1"
DBMS=xlsx out=scoredata00 replace;
run;

data scoredata01;
set scoredata00;
exchange = SUBSTR(phone, 1, 3);
run;

data scoredata2;
set scoredata01;
if exchange='000' then SUBSTR(phone, 1, 3)='408'; /*replace*/
run;

proc print data = scoredata2; run;

/*
TRIM(argument)
*/

data scoredata3;
set scoredata1;
student_name1 = trim(last_name) || ', ' || trim(first_name);
run;


/*
CATX(separator, string-1 <,...string-n>)
*/

data scoredata3;
set scoredata1;
length student_name2 $25;
student_name2 = catx(', ', last_name, first_name);
run;


/*
INDEX(source, excerpt)
*/
data scoredata4;
set scoredata00;
index_num = INDEX(phone,'408');
run;

data scoredata5;
set scoredata4;
if index_num = 1;
run;

proc print data = scoredata5;
title 'student with phone area ocde 408';
run;

/*
UPCASE(arg)
LOWCASE(arg)
PROPCASE(arg, 'delimiter(s)')
*/
data scoredata6;
set scoredata00;
full_name_up = UPCASE(full_name);
full_name_lc = LOWCASE(full_name);
full_name_pc = PROPCASE(full_name_lc, ',: ');
run;

proc print data=scoredata6; run;

/*
TRANWRD(source, target, replacement)
*/
data scoredata7;
set scoredata00;
length phone_update $10;
phone_update = TRANWRD(phone, '000', '408');
run;

/*
INT(arg)
ROUND(arg, round-off-unit)
*/

proc import datafile = "/folders/myfolders/data/score_data"
DBMS=xlsx out=scoredata000 replace;
run;

data scoredata8;
set scoredata000;
average_score = MEAN(score1, score2, score3);
run;

data scoredata9;
set scoredata8;
average_int = INT(average_score);
average_round1 = ROUND(average_score, .1);
average_round2 = ROUND(average_score, .01);
run;
