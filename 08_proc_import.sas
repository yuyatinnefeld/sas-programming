proc import datafile = "/folders/myfolders/Data/excel_data"
DBMS = xlsx out = excel_data1 replace ;
run;


proc import datafile = "/folders/myfolders/Data/excel_data"
DBMS = xlsx out = excel_data2 replace ;
getnames = no;
run;

proc import datafile = "/folders/myfolders/Data/excel_data"
DBMS = xlsx out = excel_data3 replace ;
sheet = "name_class";
run;

proc import datafile = "/folders/myfolders/Data/excel_data"
DBMS = xlsx out = excel_data4 replace ;
range = "name_class$A1:B5";
run;