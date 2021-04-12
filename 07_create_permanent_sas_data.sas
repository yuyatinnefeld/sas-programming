LIBNAME score_yu "/folders/myfolders";

DATA score_yu.stu_math;
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

 
DATA stu_math_temp;
INPUT stu_name $ math_score;
Datalines;
AAA 98
BBB 100
Anika 89
Maik 20
;
run;

Proc print data = stu_math_temp;
run;
