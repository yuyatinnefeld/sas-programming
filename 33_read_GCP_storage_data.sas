/* Store token
create token: https://developers.google.com/oauthplayground
*/

%let GCSTOKEN=ya29.a0AfH6SMD...a6nHHJlJ ;


/*
Cloud Storage API Endpoint
https://storage.googleapis.com/storage/v1/b/{bucket}/o/{object}
*/

/* Temporary fileref */
filename outcsv temp ;

/* Download the file using the REST API */
proc http
    url="https://storage.googleapis.com/storage/v1/b/yu_bucket_1/o/data%2Fusername.csv?alt=media"
    oauth_bearer="&GCSTOKEN"
    out=outcsv ;
    debug level=1 ;
run ;

/* Dump the output file in the log */
data _null_ ;
    infile outcsv ;
    input ;
    put _infile_ ;
run ;

proc import datafile=outcsv
DBMS=csv out= username replace;
delimiter=';';
run;

proc print data=username; run;
