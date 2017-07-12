                       
--2  b) find top 5 locations in the US who have got certified visa for each year.

SELECT split(worksite,'[,]')[0] as city,year,COUNT(case_status) AS number_of_petition from h1b_final WHERE case_status='CERTIFIED' and year='2011'GROUP BY year,split(worksite,'[,]')[0] ORDER BY number_of_petition desc limit 5;

SELECT split(worksite,'[,]')[0] as city,year,COUNT(case_status) AS number_of_petition from h1b_final WHERE case_status='CERTIFIED' and year='2012'GROUP BY year,split(worksite,'[,]')[0] ORDER BY number_of_petition desc limit 5;

SELECT split(worksite,'[,]')[0] as city,year,COUNT(case_status) AS number_of_petition from h1b_final WHERE case_status='CERTIFIED' and year='2013'GROUP BY year,split(worksite,'[,]')[0] ORDER BY number_of_petition desc limit 5;

SELECT split(worksite,'[,]')[0] as city,year,COUNT(case_status) AS number_of_petition from h1b_final WHERE case_status='CERTIFIED' and year='2014'GROUP BY year,split(worksite,'[,]')[0] ORDER BY number_of_petition desc limit 5

SELECT split(worksite,'[,]')[0] as city,year,COUNT(case_status) AS number_of_petition from h1b_final WHERE case_status='CERTIFIED' and year='2015'GROUP BY year,split(worksite,'[,]')[0] ORDER BY number_of_petition desc limit 5;

SELECT split(worksite,'[,]')[0] as city,year,COUNT(case_status) AS number_of_petition from h1b_final WHERE case_status='CERTIFIED' and year='2016'GROUP BY year,split(worksite,'[,]')[0] ORDER BY number_of_petition desc limit 5;
