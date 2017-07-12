#11) Export result for question no 10 to MySql database.
#Create a Database in mysql and create a table in it

mysql -u root -p'933668' -e 'drop database question11;create database if not exists question11;use question11;create table question11(job_title varchar(100),success_rate float,petitions int);';
sqoop export --connect jdbc:mysql://localhost/question11 --username root --password '933668' --table question11 --update-mode allowinsert  --export-dir /h1b/Question10/p* --input-fields-terminated-by '\"' ;
echo -e '\n\nContents Exported to MySQL Database:\n\n'

mysql -u root -p'933668' -e 'select * from question11.question11';
