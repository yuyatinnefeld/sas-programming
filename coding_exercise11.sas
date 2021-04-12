proc import datafile="/folders/myfolders/data/score_data_id_class"
DBMS=xlsx out=student_level replace;
run;

proc import datafile="/folders/myfolders/data/class_info"
DBMS=xlsx out=class_level replace;
run;


proc sort data = student_level; by class; run;
proc sort data = class_level; by class; run;

data merge_dataset1;
merge student_level class_level;
by class;
run;


data merge_dataset2;
merge student_level class_level (in = inC);
by class;
if inC;
run;

proc print data = merge_dataset1; run;
proc print data = merge_dataset2; run;
proc print data = student_level; run;
proc print data = class_level; run;