select soc_name , COUNT(soc_name) AS C from h1b_final where job_title LIKE 'DATA SCIENTIST' group by soc_name order by C desc LIMIT 1;

