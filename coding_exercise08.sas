proc import datafile="/folders/myfolders/data/patient_hd"
DBMS=xlsx out=hospital0 replace;
run;

data hospital1;
set hospital0;
start_year = year(start_date);
end_year = year(end_date);
stayed_day = INTCK('day', start_date, end_date);
stayed_day2 = datDIF(start_date,end_date,'ACT/ACT');
analysis_date = today();
format analysis_date date10.;
run;