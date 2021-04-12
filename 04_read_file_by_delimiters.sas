
/* 
   	dlm = Delimiter
	other options:
   	infile "/folders/myfolders/other_del_data.txt" delimiter = ':';     
   	infile "/folders/myfolders/other_del_data.txt" dsd dlm = ':';    
*/

data sdata_colon;
   infile "/folders/myfolders/Data/other_del_data.txt" dlm = ':'; 
   input name $ Gender $ Age $ Weight;
run;


proc print data=sdata_colon;
run;

