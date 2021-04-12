/*

DO index-variable = start To stop BY increment;
	SAS statements
END;

*/

/* program without Do loops */

data earnings1;
	Interest = .0375;
	Total = 100;
	
	Year + 1;
	Total + Interest * Total;
	
	Year + 2;
	Total + Interest * Total;
	
	Year + 3;
	Total + Interest * Total;
	
	format Total dollar10.2;
run;

proc print data=earnings1; run;


/* program without Do loops */

data earnings2;
	Interest = .0375;
	Total = 100;
	
	DO year = 0 to 2;
		Total + Interest * Total;
	END;
	
	format Total dollar10.2;
run;

proc print data=earnings2; run;

data earnings3;
	Interest = .0375;
	Total = 100;
	
	DO year = 0 to 2;
		Total + Interest * Total;
		output;
	END;
	
	format Total dollar10.2;
run;

proc print data=earnings3; run;

/*

DO UNTIL(expression);
	SAS statements
END;
*/

data invest;
	DO UNTIL(capital>=50000);
		capital+6000;
		capital+capital*.05;
		year+1;
	END;
run;

/*
DO WHILE(expression);
	SAS statements
END;
*/

data invest;
	DO WHILE(capital>=50000);
		capital+6000;
		capital+capital*.05;
		year+1;
	END;
run;


data invest;
	DO year=1 to 10 until(capital>=50000);
		capital+2000;
		capital+capital*.10;
	END;
	IF year = 11 THEN year = 10;
run;



