proc import datafile = "/folders/myfolders/data/allscore"
DBMS=xlsx out=all_score0 replace;
run;

proc import datafile = "/folders/myfolders/data/score_data_id"
DBMS=xlsx out=scoredata_0 replace;
run;

proc sql;
	create table all_score1 as
	select	stuid,
			math
	from all_score0;
quit;

proc sql;
	create table scoredata_1 as
	select	stu_id,
			score2
	from scoredata_0;
quit;


proc sql;
	create table join_table as
	select 	stu_id,
			stuid,
			read,
			math,
			name
	from all_score0 as asd inner join scoredata_0 as sd
	on asd.stuid = sd.stu_id;
quit;


proc sql;
	create table join_table as
	select 	stu_id,
			stuid,
			read,
			math,
			name
	from all_score0 as asd right join scoredata_0 as sd
	on asd.stuid = sd.stu_id;
quit;
