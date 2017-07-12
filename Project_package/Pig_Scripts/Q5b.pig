-- /home/hduser/H1B-Filtered/h1b
-- /Project-Data/h1b

H1B = load '/Project-Data/h1b' using PigStorage() as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, work_site:chararray, longitude:double, lattitude:double);

LIMITDATA = foreach H1B generate job_title, year, case_status;

filter_data = filter LIMITDATA by case_status == 'CERTIFIED';

Group_1 = group filter_data by (job_title, year, case_status);

counter = foreach Group_1 generate FLATTEN(group) as (job_title, year, case_status), COUNT(filter_data) as count_data;
prefinal = group counter by year;
final = foreach prefinal { sort = order counter by $3 desc; limiter = LIMIT sort 10 ; generate limiter; };
--dump final;
perfect = foreach final generate flatten(limiter);
dump perfect;
