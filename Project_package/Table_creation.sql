Create Database Project_Main;

use Project_Main;

CREATE TABLE h1b_app(s_no int,case_status string, employer_name string, soc_name string, job_title string, full_time_position string,prevailing_wage int,year string, worksite string, longitute double, latitute double )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'WITH SERDEPROPERTIES ("separatorChar" = "," , "quoteChar" = "\"") STORED AS TEXTFILE;

load data local inpath '/home/hduser/Project_package/Project-Data/h1b.csv' into table h1b_app;

--select * from h1b_app limit 10;

CREATE TABLE h1b_app2(s_no int,case_status string, employer_name
string, soc_name string, job_title string, full_time_position
string,prevailing_wage int,year string, worksite string, longitute
double, latitute double )
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE h1b_app2 SELECT regexp_replace(s_no, "\t", ""),
regexp_replace(case_status, "\t", ""), regexp_replace(employer_name,
"\t", ""), regexp_replace(soc_name, "\t", ""),
regexp_replace(job_title, "\t", ""),
regexp_replace(full_time_position, "\t", ""),
regexp_replace(prevailing_wage, "\t", ""), regexp_replace(year, "\t",
""), regexp_replace(worksite, "\t", ""), regexp_replace(longitute,
"\t", ""), regexp_replace(latitute, "\t", "") FROM h1b_app
where case_status != "NA";

CREATE TABLE h1b_final(s_no int,case_status string, employer_name
string, soc_name string, job_title string, full_time_position
string,prevailing_wage int,year string, worksite string, longitute
double, latitute double )
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE h1b_final SELECT s_no,
case when trim(case_status) = "PENDING QUALITY AND COMPLIANCE REVIEW - UNASSIGNED" then "DENIED"
when trim(case_status) = "REJECTED" then "DENIED"
when trim(case_status) = "INVALIDATED" then "DENIED"
else case_status end,
employer_name, soc_name, job_title,
full_time_position,prevailing_wage,year, worksite, longitute, latitute
FROM h1b_app2;

drop table h1b_app;
drop table h1b_app2;

INSERT OVERWRITE DIRECTORY '/Project-Data' row format delimited fields terminated by '\t' 
select * from h1b_final;
