
proc import datafile = "/folders/myfolders/Data/sale"
DBMS = xlsx out = sale0 replace ;
run;

data sale1;
set sale0;
	label	emid = 'employee id'
			sale_m1 = 'sale in Jan.'
			sale_m2 = 'sale in Feb.'
			sale_m3 = 'sale in Mar.';
AverageSale = mean (sale_m1, sale_m2, sale_m3);
format AverageSale sale_m1 --sale_m3 dollar10.2;
run;

proc print data = sale1 label; run;





libname myfmts "/folders/myfolders/formats";
proc format library = myfmts;
	VALUE salegroup low-<700 = 'need improvement'
		700-<900 = 'good'
		900-High = 'top sale'
;
run;

options fmtsearch=(myfmts work library);
proc print data = sale1;
	format AverageSale salegroup.;
run;

proc format library=myfmts fmtlib;