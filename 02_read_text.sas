
/*
Tim M 50 145
Sara . 23 130 
Mike M 65 180
Laura F . 130
Sean M 15 167
*/

data sdata_blanks;
	infile "/folders/myfolders/Data/DATA_blanks.txt";
	input Name $ Gender $ Age $ Weight;
run;

proc print data=sdata_blanks;
run;
	