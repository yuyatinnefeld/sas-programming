
proc import datafile="/folders/myfolders/data/allscore_miss_text"
DBMS=xlsx out=scoredata0 replace;
run;

data scoredata1 (drop = i);
set scoredata0;

array score_list (4) read math science write;
do i = 1 to 4;
	if score_list(i) = 'missing' then score_list(i) =.;
end;

avg_score = mean(read, math, science, write);
total_score = sum(read, math, science, write);
diff_math = math - avg_score;

format avg_score 5.2;

run;

proc print data=scoredata1(keep=read math science write avg_score total_score diff_math); run;



proc import datafile="/folders/myfolders/data/sale_state"
DBMS=xlsx out=sale0 replace;
run;


data sale_dataset(drop=i j);
set sale0;
	array sale(2, 3) SaleCA1 -- SaleTX3;
	array state_sale (2) state_sale_CA state_sale_TX;
	do i = 1 to 2;
		state_sale(i)=0;
		do j = 1 to 3;
			state_sale(i)+sale(i,j);
		end;
	end;

run;

proc print data = sale_dataset;
format saleCA1 -- state_sale_TX dollar10.;
run;