H1B = load '/home/hduser/H1B-Filtered/h1b' using PigStorage() as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, work_site:chararray, longitude:double, lattitude:double);

LIMITDATA = foreach H1B generate job_title, year;

Group_1 = group LIMITDATA by year;
-- Group_2 = group Group_1 by LIMITDATA.$0;
-- ERROR org.apache.pig.tools.grunt.Grunt - ERROR 1068: Using Bag as key not supported.

Count_job = foreach Group_2 generate group COUNT(LIMITDATA);

--splitting = foreach Count_year generate flatten(COUNT(filter_data));

