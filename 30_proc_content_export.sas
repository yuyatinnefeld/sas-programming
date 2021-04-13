/*
PROC Contents
show lib info
*/

libname score "/folders/myfolders";

proc contents data = score._ALL_ NODS; run;

proc contents data = score._ALL_; run;

proc contents data = score.scd_id; run;

/*
PROC EXPORT
*/

libname score "/folders/myfolders/export_files";


proc export data=score.scd_id
	outfile = '/folders/myfolders/export_files/exported_scd_id.csv' 
   	dbms=csv
   	replace;
run;



proc export data=score.scd_id
	outfile = '/folders/myfolders/export_files/exported_scd_id' 
   	dbms=dlm
   	replace;
   	delimiter='&';
run;



proc export data=score.scd_id
	outfile = '/folders/myfolders/export_files/exported_scd_id_excel' 
   	dbms=xlsx
   	replace;
	sheet = 'data';
run;
