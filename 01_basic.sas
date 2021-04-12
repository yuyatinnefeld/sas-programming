*This is the comment area;

/*
This is also a comment area
*/

data stu_math;
input stu_name $ math_score;
cards;
Speedy 90
Tim 91
Sharon 50
Mike 60
Michael 70
Miri 80
Colin 102
;
run;

proc means data = stu_math;
var math_score;
run;
