/* 
MDY Function
MDY(month, day, year)
YEAR(date), MONTH(date), QTR(date), WEEK(date)
*/

proc import datafile="/folders/myfolders/data/sas date"
DBMS=xlsx out=scoredata0 replace;
run;

data scoredata1;
set scoredata0;
Bdate = mdy(month, day, year);
fix_date1 = mdy(8, 31, 1950);
fix_date2 = mdy(8, 31, 2050);
fix_date3 = mdy(8, 31, 50);
start_week = week(start_date);
start_year = year(start_date);
start_weekday= weekday(start_date);
run;

proc print data=scoredata1;
format Bdate date9. fix_date1 date9. fix_date2 date9. fix_date3 date9.;
run;


/*
INTCK('interval', form, to)
Ex. INTCK('year', start_date, today())
*/

data scoredata2;
set scoredata0;
today_date1 = today();
today_date2 = date();
years = INTCK('year', start_date, today());
month = INTCK('month', start_date, today());
run;

proc print data = scoredata2;
format today_date1 today_date2 date9.;
run;

/*
DATDIF(start_date, end_date, basis)
YRDIF(start_date, end_date, basis)
*/


data scoredata3;
set scoredata0;
year_diff1 = yrdif(start_date, today(), '30/360');
year_diff2 = yrdif(start_date, '9Apr2021'd, 'ACT/ACT');
year_diff3 = yrdif(start_date, today(), 'ACT/360');
year_diff4 = yrdif(start_date, '9Apr2021'd, 'ACT/365');

day_diff1 = datDIF(start_date, today(), '30/360');
day_diff2 = datDIF(start_date, '9Apr2021'd, 'ACT/365');
run;


proc print data=scoredata3; run;
