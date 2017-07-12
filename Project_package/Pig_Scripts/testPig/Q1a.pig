
-- s_no int,case_status string, employer_name
-- string, soc_name string, job_title string, full_time_position
-- string,prevailing_wage int,year string, worksite string, longitute
-- double, latitute double

-- /home/hduser/H1B-Filtered/h1b
-- /Project-Data/h1b

H1B = load '/home/hduser/H1B-Filtered/h1b' using PigStorage() as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, work_site:chararray, longitude:double, lattitude:double);

LIMITDATA = foreach H1B generate job_title, year;

filter_data = filter LIMITDATA by job_title == 'DATA ENGINEER';

Group_1 = group filter_data by year;

Group_2 = group filter_data all;

Count_year = foreach Group_1 generate group as year, COUNT(filter_data) as number;
Count_total = foreach Group_2 generate group, COUNT(filter_data);

grouping = group Count_year all;
Convert = foreach grouping { sorter = Count_year; generate FLATTEN(BagToTuple(sorter)); }; 
--splitting = foreach Count_year generate flatten(number);
--splitting = foreach splitting generate TOTUPLE($0);
--splitting = foreach Convert generate TOTUPLE($1);

final = foreach Convert generate (($4-$2)+($6-$4)+($8-$6)+($10-$8)+($12-$10)) as growth_fact;

dump final;

final = foreach Convert generate $2, $4, $6;
