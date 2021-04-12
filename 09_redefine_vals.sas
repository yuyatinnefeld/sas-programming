proc import datafile = "/folders/myfolders/Data/score_data"
DBMS = xlsx out = scoredata0 replace ;
run;

DATA scoredata1;
	set scoredata0;
	Grade =7;
	ScoreType = 'Math Scores';
	TotalScore = score1 + score2 + score3;
	TotalScore_func = sum (score1, score2, score3);
	AverageScore = TotalScore / 3;
	AverageScore_func = mean (score1, score2, score3);
	Gender_func = UPCASE(gender);
run;

proc print data = scoredata1;
