data salary1;

	salary = 60000;
	p = .03;
	
	DO year = 0 to 4;
		salary + salary * p;
	END;
	
	format salary dollar10.2;
run;


data salary2;

	salary = 60000;
	p = .03;
	
	DO Until(salary >=100000);
		salary + salary * p;
		year+1;
	END;
	
	format salary dollar10.2;
run;