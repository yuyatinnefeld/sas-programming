/*

1. create S3 conf file (.tks3.conf) like this:

ssl=yes
keyID=AKFKI8....KEUQ
secret=wb8....GpLvYVv
region=eu-central-1

2. store the .tks3.conf file in /conf

3. restrict access to the .tks3.conf

chmod 700 /conf/.tks3.conf

*/

%let bucket=sas-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db ;


/*Upload a local CSV file to AWS S3 bucket */
proc s3 config="/folders/myfolders/conf/.tks3.conf";
   put "/folders/myfolders/data/allscore.xlsx" "/&bucket/allscore.xlsx";
   list "/sas-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db";
run;


/*Create a new S3 bucket*/
proc s3 config="/folders/myfolders/conf/.tks3.conf";
   mkdir "/new-bucket-hallooooo829430834";
run;


/*Copy a file into the another S3 bucket*/
proc s3 config="/folders/myfolders/conf/.tks3.conf";
   copy "/sas-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db/allscore.xlsx" "/new-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db/copied.xlsx";
run;

/*Donwload a S3 file*/
proc s3 config="/folders/myfolders/conf/.tks3.conf";
   get "/sas-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db/allscore.xlsx" "/folders/myfolders/allscore.xlsx";
run;


/*Delete a file in the S3 bucket*/
proc s3 config="/folders/myfolders/conf/.tks3.conf";
   delete "/new-bucket-hallooooo829430834/allscore.xlsx";
run;





/*create enckeys and handle with these keys*/

proc s3 config="/folders/myfolders/conf/.tks3.conf";

   /* IAM:KMS keys */
   enckey add name="yuiam1" id="98v27390-1si1-8sc9-38k0-k893j354nw5g";
   enckey add name="yuiam2" id="22f87852-0ak1-5xy2-01j1-l852g809gx4q";


   /* SSE-C keys (user-specified) as character string */
   enckey add name="yussec1" key="ke-sj-eb-ok-qk-zi-nb-lu-fh-wi-zi";
   enckey add name="yussec2" key="wl-tk-64-rk-i0-zn-wk-7c-s8-a8-jk";


   /* SSE-C (user-specified) keys as hex data */
   enckey replace name="yussechex1" 
      hexkey="e1d2e3bb4a5f6079889706b3c4d1e2f999f2c3bb4c5f6079888706f6a4b3e2da";
   enckey replace name="yussechex2" 
      hexkey="9892940203456892093758029375728394010928374674839201837583920192";

run;


/* s3data.sas */
%include "keys.sas";


proc s3 config="/folders/myfolders/conf/.tks3.conf";
  enckey list;

  put enckey="yuiam1" "/folders/myfolders/data/DATA_blanks.txt" "/sas-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db/DATA_blanks.txt";
  copy srckey="yuiam2" "/sas-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db/DATA_blanks.txt" enckey="yuiam2" "/new-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db/bar.txt";
  get enckey="yussec2" "/sas-bucket8269d57a-0364-4348-b8b2-e5dc67a5c4db/DATA_blanks.txt" "/folders/myfolders/foo-get.txt";

run;
