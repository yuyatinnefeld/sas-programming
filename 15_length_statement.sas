proc import datafile = "/folders/myfolders/Data/sale"
DBMS=xlsx out=sale0 replace;
run;

data sale1;
set sale0;
if gender = 'm' then gender_full = 'Male';
else if gender = 'f' then gender_full = 'Female';
else gender_full = 'Missing';
run;

