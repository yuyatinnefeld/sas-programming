/* Dataline = Cards */

DATA stu_math;
INPUT stu_name $ math_score;
Datalines;
John 98
Tom 100
Anika 89
Maik 20
;
run;

Proc print data = stu_math;
run;

