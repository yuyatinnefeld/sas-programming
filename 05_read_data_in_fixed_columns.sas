/*
Tim  M14510/21/1978
Sara  13009/20/1964
Mike M18011/23/1965
LauraF13011/06/1980
Sean M16704/07/2000
*/

/* PART 0  */
data sdata_column;
	infile "/folders/myfolders/Data/DATA_column.txt";
	input 	Name $ 1-5
			Gender $ 6
			Weight 7-9
			DOB $ 10-19;
run;

proc print data = sdata_column;
run;


/*formated input*/
/* PART 1  */
data sdata_column;
infile "/folders/myfolders/Data/DATA_column.txt";
input 
@1 Name	$ 5.
@6 Gender   $  1.
@7 Weight	3.
@10 DOB     mmddyy10.;
Run;

proc print data = sdata_column;
run;

/* PART 2  */
proc print data = sdata_column;
format DOB mmddyy10.;
run;


/* PART 2.B  */
proc print data = sdata_column;
format DOB date9.;
run;


/* PART 3  */
data sdata_column;
infile "/folders/myfolders/Data/DATA_column.txt";
input 
@1 Name	$ 5.
@6 Gender   $  1.
@7 Weight	3.
@10 DOB     mmddyy10.;
format DOB date9.;
Run;

proc print data = sdata_column;
run;
