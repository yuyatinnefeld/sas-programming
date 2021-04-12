proc import datafile ="/folders/myfolders/data/chara_data2"
DBMS=xlsx out=chara_data0 replace;
run;

/*DOB 1/4/2007 */

data chara_data1;
set chara_data0;
DOB_year = SCAN(DOB, 3, '/');
DOB_month = SUBSTR(DOB, 1, 1);
DOB_day = SCAN(DOB, 2, '/');
run;

data chara_data2;
set chara_data1;
length DOB_new1 $20;
length DOB_new2 $20;

DOB_new1 = CATX(', ', DOB_year, DOB_month, DOB_day);
DOB_new2 = TRIM(DOB_year)||', '||TRIM(DOB_month)||', '||TRIM(DOB_day);
run;

data chara_data3;
set chara_data2;
raw_score = TRANWRD(raw_score, 'missing', '');
year_idx = INDEX(DOB, '2007');
run;

data result;
set chara_data3;
if year_idx ne 0;
run;