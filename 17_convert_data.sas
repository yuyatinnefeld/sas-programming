proc import datafile = "/folders/myfolders/Data/convert data"
DBMS=xlsx out=scoredata0 replace;
run;

/*convert char > numeric */
/*char > num = INPUT*/

data scoredata1;
set scoredata0;
score_ac = raw_score *1; /*auto*/
score_num = input(raw_score, 7.); /*input*/
run;

/*convert numeric > char */
/*num > char = PUT*/
data scoredata2;
set scoredata0;
gender_ac = gender||'/'||gender_code; /*auto*/
gender_char = put (gender_code, 8.); /*put*/
run;