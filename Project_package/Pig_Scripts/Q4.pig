-- /home/hduser/H1B-Filtered/h1b
-- /Project-Data/h1b

H1B = load '/Project-Data/h1b' using PigStorage() as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, work_site:chararray, longitude:double, lattitude:double);

LIMITDATA = foreach H1B generate employer_name, year;

Group_1 = group LIMITDATA by (employer_name,year);

Count_emp = foreach Group_1 generate FLATTEN(group) as (employer_name, year), COUNT(LIMITDATA) as count_no;
prefinal = group Count_emp by year;
final = foreach prefinal { sort = order Count_emp by $2 desc; limiter = LIMIT sort 5; generate limiter; };
--dump final;
perfect = foreach final generate flatten(limiter);
dump perfect;
