use Project_Main;

drop table Q21;
drop table Q22;
drop table Q23;
drop table Q24;
drop table Q25;
drop table Q26;

CREATE TABLE Q21( location string, count_apps int, year string)
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE;

insert into Q21 select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_count, year from h1b_final where case_status LIKE 'CERTIFIED' and year LIKE '2011' group by split(worksite,'[,]')[1], year order by job_count desc limit 5;
 
CREATE TABLE Q22( location string, count_apps int, year string)
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE;

insert into Q22 select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_count, year from h1b_final where case_status LIKE 'CERTIFIED' and year LIKE '2012' group by split(worksite,'[,]')[1], year order by job_count desc limit 5;

CREATE TABLE Q23( location string, count_apps int, year string)
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE;

insert into Q23 select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_count, year from h1b_final where case_status LIKE 'CERTIFIED' and year LIKE '2013' group by split(worksite,'[,]')[1], year order by job_count desc limit 5;

CREATE TABLE Q24( location string, count_apps int, year string)
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE;

insert into Q24 select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_count, year from h1b_final where case_status LIKE 'CERTIFIED' and year LIKE '2014' group by split(worksite,'[,]')[1], year order by job_count desc limit 5;

CREATE TABLE Q25( location string, count_apps int, year string)
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE;

insert into Q25 select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_count, year from h1b_final where case_status LIKE 'CERTIFIED' and year LIKE '2015' group by split(worksite,'[,]')[1], year order by job_count desc limit 5;

CREATE TABLE Q26( location string, count_apps int, year string)
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE;

insert into Q26 select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_count, year from h1b_final where case_status LIKE 'CERTIFIED' and year LIKE '2016' group by split(worksite,'[,]')[1], year order by job_count desc limit 5;

select location, count_apps, year from q21 union all select location, count_apps, year from q22 union all select location, count_apps, year from q23 union all select location, count_apps, year from q24 union all select location, count_apps, year from q25 union all select location, count_apps, year from q26;
