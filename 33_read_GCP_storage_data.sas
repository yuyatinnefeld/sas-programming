/* 
1. create GCSTOKEN 
https://developers.google.com/oauthplayground


2. update cloud Storage API Endpoint
https://storage.googleapis.com/storage/v1/b/{bucket}/o/{object}

%2F = /
/data/username.csv => data%2Fusername.csv

*/

/* 3. define store token*/
%let GCSTOKEN=ya29.a0AfH6SMD...a6nHHJlJ ;

/* 4. define temporary fileref */
filename outcsv temp ;

/* 5. download the file using the REST API */
proc http
    url="https://storage.googleapis.com/storage/v1/b/yu_bucket_1/o/data%2Fusername.csv?alt=media"
    oauth_bearer="&GCSTOKEN"
    out=outcsv ;
    debug level=1 ;
run ;

/* 6. dump the output file in the log */
data _null_ ;
    infile outcsv ;
    input ;
    put _infile_ ;
run ;

/* 7. convert to sas table form  */
proc import datafile=outcsv
DBMS=csv out= username replace;
delimiter=';';
run;


proc print data=username; run;
