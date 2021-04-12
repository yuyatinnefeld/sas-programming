data fmt;
retain fmtname '$statefmt';
length start $2 label $2;
input start $ label $;
datalines;
01 CA
02 TX
03 NJ
;
run;

proc print data = fmt; run;

proc format cntlin=fmt; run;

proc import datafile = "/folders/myfolders/Data/proc format_CNTLIN"
DBMS = xlsx out = state0 replace;
run;

data state1;
set state0;
format state $statefmt.;
run;