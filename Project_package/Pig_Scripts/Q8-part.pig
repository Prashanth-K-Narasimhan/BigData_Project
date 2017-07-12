-- /home/hduser/H1B-Filtered/h1b
-- /Project-Data/h1b

H1B = load '/Project-Data/h1b' using PigStorage() as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, work_site:chararray, longitude:double, lattitude:double);

LIMITDATA = foreach H1B generate prevailing_wage, job_title, year, full_time_position ;
filter_data = filter LIMITDATA by full_time_position == 'N';
Group_1 = group filter_data by (job_title, year, full_time_position);

average = foreach Group_1 generate FLATTEN(group) as (job_title, year, full_time_position), AVG(filter_data.prevailing_wage) as average_wage;
prefinal = group average by (year, full_time_position);
final = foreach prefinal { sort = order average by $3 desc; generate sort; };
--dump final;
perfect = foreach final generate flatten(sort);
dump perfect;

