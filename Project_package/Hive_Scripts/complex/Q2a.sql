-- Q 2a)
select max(foo.job_count) as maximum , year from(select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_count, year from h1b_final where job_title LIKE 'DATA ENGINEER' group by split(worksite,'[,]')[1], year) foo group by year order by maximum desc;


select max(struct(foo.state)).col1, max(foo.job_count) as maximum , year from(select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_count, year from h1b_final where job_title LIKE 'DATA ENGINEER' group by split(worksite,'[,]')[1], year order by job_count) foo group by year order by maximum desc;
