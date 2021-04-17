/*

1. Create a new table
PROC SQL;
	CREATE TABLE scoredata0 AS
	SELECT stu_id, gender, name
	FROM score_data
	WHERE gender in ('m');
OUIT;

2. Call the table values

PROC SQL
	SELECT xxx 
	FROM xxx
	(WHERE) xxx
	(GROUP BY) xxx
	(HAVING) xxx
	(ORDER BY) xxx
;
QUIT;


*/

proc import datafile = "/folders/myfolders/data/score_data_id"
DBMS = xlsx out = score_data;
run;


proc sql;
	create table scoredata0 as 
	select 	stu_id,
			gender,
			name
	from score_data
	where gender in ('m');
quit;


proc sql;
	select *
	from score_data;
quit;


proc sql;
	select	stu_id,
			gender,
			name
	from score_data
	where gender in ('m');
quit;


/*
Retrieve Data


PROC SQL
	title 'Table One and Table two';
	SELECT * FROM one, two
	WHERE one.x = two.x
QUIT;

INNER JOIN


PROC SQL;
	SELECT p.county, barrelsperday 'Production', barrels 'Reservers'
	FROM SQL.oliprod p INNER JOIN SQL.oilrsrvs r
	ON p.country = r.country;
QUITE;

*/


proc import datafile = "/folders/myfolders/data/score_data_id_no_gender_1l"
DBMS = xlsx out = score_data_ng;
run;


proc import datafile = "/folders/myfolders/data/score_data_id_gender_only_1l"
DBMS = xlsx out = score_data_g;
run;

proc sql;
	create table inner_sql as
	select 	g.stu_id,
			score1,
			score2,
			score3,
			gender,
			g.Name
	from score_data_g as g inner join score_data_ng as ng
	on g.stu_id = ng.stu_id;
	
quit;

proc sql;
	create table inner_sql_where as
	select 	g.stu_id,
			score1,
			score2,
			score3,
			gender,
			g.Name
	from score_data_g as g, score_data_ng as ng
	where g.stu_id = ng.stu_id;
	
quit;	

proc print data=score_data_g;
title "students gender information - stu_id = 1l in not included";
run;


proc print data=score_data_ng;
title "students gender information - stu_id = 5 in not included";
run;

proc print data=inner_sql;
title "INNER JOIN + ON";
run;

proc print data=inner_sql_where;
title "WHERE JOIN";
run;

	
/*
Outher JOIN (LEFT, RIGHT, FULL)
*/

proc sql;
	select 	g.stu_id, ng.stu_id,
			score1,
			score2,
			score3,
			gender,
			g.Name
	from score_data_g as g left join score_data_ng as ng
	on g.stu_id = ng.stu_id;
quit;


proc sql;
	select 	g.stu_id, ng.stu_id,
			score1,
			score2,
			score3,
			gender,
			g.Name
	from score_data_g as g right join score_data_ng as ng
	on g.stu_id = ng.stu_id;
quit;

proc sql;
	select 	g.stu_id, ng.stu_id,
			score1,
			score2,
			score3,
			gender,
			g.Name
	from score_data_g as g full join score_data_ng as ng
	on g.stu_id = ng.stu_id;
quit;

