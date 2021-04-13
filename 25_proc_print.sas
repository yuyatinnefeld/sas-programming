proc import datafile="/folders/myfolders/data/score_data_id_class"
DBMS=xlsx out=scoredata0 replace;
run;

proc print data=scoredata0; run;

proc print data = scoredata0 obs = 'obs. num'; run;

proc print data = scoredata0 noobs; run;

proc print data = scoredata0; ID name; run;

proc sort data = scoredata0; by name; run;

proc print data = scoredata0; ID name; run;

proc print data = scoredata0;
var name stu_id gender class;
ID name;
run;

proc print data = scoredata0;
var stu_id gender class;
ID name;
where gender = 'm' and class in ('a', 'c');
run;


/*proc print ... + sum */

proc import datafile="/folders/myfolders/data/FunRun_data_id_class"
DBMS=xlsx out=FR0 replace;
run;


proc print data=FR0 noobs;
var name stu_id gender class fund;
sum fund;
format fund dollar5.1;
title "origin table - sum";
run;

/*grouping subtotals by class */

proc sort data = FR0; by class; run;

proc print data=FR0 noobs;
var name stu_id gender class fund;
sum fund;
by class;
title "computing group table - sum";
run;

proc print data=FR0 noobs sumlabel="total fund raised" grandtotal_label="grand total fund raised";
var name stu_id gender class fund;
sum fund;
by class;
title "fund raised by class";
run;


proc print data=FR0 noobs sumlabel="total fund raised" grandtotal_label="grand total fund raised";
var name stu_id gender fund;
sum fund;
by class;
id class;
title "fund raised by class with diff appearance";
run;


