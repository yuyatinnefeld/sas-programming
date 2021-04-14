/*
Output types:

EPUB or Excel or HTML or PDF or RTF or PPT


ODS output-destination 1 <options>
....
ODS output-destination (n) <options>
<your SAS program>
ODS destination close statement 1;
...

ODS destination close statement(n);
*/

/* Export PDF , RTF, PPT */

proc import datafile="/folders/myfolders/data/score_data_miss999"
DBMS=xlsx out= scoredata0 replace;
run;

ods pdf file="/folders/myfolders/export_files/scoredata0.pdf";
ods rtf file="/folders/myfolders/export_files/scoredata0.rtf";
ods powerpoint file="/folders/myfolders/export_files/scoredata0.ppt";

proc print data=scoredata0;
id name;
run;

ods pdf close;
ods rtf close;
ods powerpoint close;

/* ods _ALL_ CLOSE; */


/* Export HTML */

proc import datafile="/folders/myfolders/data/score_data_miss999"
DBMS=xlsx out= scoredata0 replace;
run;

ods html file="/folders/myfolders/export_files/scoredata0.html";
proc print data=scoredata0;
id name;
title 'score data table'
run;

proc means data=scoredata0;
var score1 score2 score3;
class gender;
title 'score means by gender';
run;

ods html close;

/* Export EXCEL with manipulated worksheet */

proc import datafile="/folders/myfolders/data/score_data_miss999"
DBMS=xlsx out= scoredata0 replace;
run;

proc sort data = scoredata0 out=scoredata1;
by gender;
run;

ods excel file="/folders/myfolders/export_files/multi_table.xlsx"
	options(
		sheet_interval="bygroup"
		sheet_label="gender"
		embedded_titles="yes"
		embed_titles_once="yes"
	);
	
title 'summary of score by gender';
ods noproctitle;

proc means data = scoredata1 maxdec = 1 n mean max min;
	by gender;
	var score1 score2 score3;
	where gender ne ' ';
run;

ods excel close;


		
		
		
		





