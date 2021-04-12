/*
dsd = delimiter sensitive data 
1: it ignores delimiters in data values enclosed in quotation marks; 
2: it ignores quotation marks as part of your data; 
3: it treats two consecutive delimiters in a row as missing value.
*/

data sdata_blanks;
	infile "/folders/myfolders/Data/DATA_commas.csv" dsd;
	input Name $ Gender $ Age $ Weight;
run;

proc print data=sdata_blanks;
run;