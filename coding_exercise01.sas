LIBNAME perm_pid "/folders/myfolders";

data perm_pid.pd;
infile "/folders/myfolders/Data/Patient_HD_age.txt";
input 
@1 Pid			1.
@2 Sdate		mmddyy10.
@12 Edate		mmddyy10.
@22 Age			2.;
format Sdate 	date9.;
format Edate 	date9.;
run;


proc print data = perm_pid.pd;
run;