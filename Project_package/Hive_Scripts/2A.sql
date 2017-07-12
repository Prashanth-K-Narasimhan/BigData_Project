
--2 a) Which part of the US has the most Data Engineer jobs for each year?

SELECT split(worksite,'[,]')[1] as state,COUNT(case_status) AS number_of_petition,year from h1b_final WHERE job_title LIKE 'DATA ENGINEER' and year='2011' GROUP BY split(worksite,'[,]')[1], year ORDER BY number_of_petition desc limit 1;

SELECT split(worksite,'[,]')[1] as state,COUNT(case_status) AS number_of_petition,year from h1b_final WHERE job_title LIKE 'DATA ENGINEER' and year='2012' GROUP BY split(worksite,'[,]')[1], year ORDER BY number_of_petition desc limit 1;

SELECT split(worksite,'[,]')[1] as state,COUNT(case_status) AS number_of_petition,year from h1b_final WHERE job_title LIKE 'DATA ENGINEER' and year='2013' GROUP BY split(worksite,'[,]')[1],year ORDER BY number_of_petition desc limit 1;

SELECT split(worksite,'[,]')[1] as state,COUNT(case_status) AS number_of_petition,year from h1b_final WHERE job_title LIKE 'DATA ENGINEER' and year='2014' GROUP BY split(worksite,'[,]')[1],year ORDER BY number_of_petition desc limit 1;

SELECT split(worksite,'[,]')[1] as state,COUNT(case_status) AS number_of_petition,year from h1b_final WHERE job_title LIKE 'DATA ENGINEER' and year='2015' GROUP BY split(worksite,'[,]')[1],year ORDER BY number_of_petition desc limit 1;
