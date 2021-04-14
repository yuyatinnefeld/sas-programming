proc import datafile = "/folders/myfolders/data/score_data_miss777" 
DBMS = xlsx out = scoredata0 replace ;
run;
 
data scoredata1;
set scoredata0;
 
ARRAY sc (3) score1 score2 score3;    
   ARRAY new (3) ns1 ns2 ns3; 
   DO i = 1 TO 3;                       
      IF sc(i) = 777 THEN new(i) =.;   
      Else if sc(i) NE 777 then new(i) = sc(i);
   END;  
   
averagescore = mean (ns1, ns2, ns3);
run; 


proc sort data=scoredata1 out=scoredata2;
by gender descending averagescore;
run;

proc print data = scoredata2;
run;
 
proc freq data = scoredata2;
table gender;
run;

proc means data = scoredata2 maxdec = 1 n mean max min;
	var ns1 ns2 ns3 averagescore;
	title 'summary of score';
run;


proc sort data = scoredata2 out= scoredata3;
by gender;
run;

proc univariate data = scoredata3;
	var ns1 - ns3;
	by gender;
	title 'summary of average scores by gender'
run;