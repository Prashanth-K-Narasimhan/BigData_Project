#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 0) ${MENU} Filter the data in project-data folder and move to hive/hdfs.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1) ${MENU} Is the number of petitions with Data Engineer job title increasing over time?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2) ${MENU} Find top 5 job titles who are having highest average growth in applications. ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3) ${MENU} Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4) ${MENU} find top 5 locations in the US who have got certified visa for each year.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5) ${MENU} Which industry (SOC) has the most number of Data Scientist positions?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6) ${MENU} Which top 5 employers file the most petitions each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year (all applications)?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year (only certified applications)?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9) ${MENU} Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10) ${MENU} Create a bar graph to depict the number of applications for each year${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11) ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order${NORMAL}"
    echo -e "${MENU}**${NUMBER} 12) ${MENU} Which are employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 13) ${MENU} Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 14) ${MENU}Export result for option no 13 to MySQL database.${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
clear
show_menu
	while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
	0) clear;
        option_picked "Filtering the data in project-data folder and move to hive/hdfs.";
	
		hive -f /home/hduser/Project_package/Table_creation.sql
	
        show_menu;
        ;;

        1) clear;
        option_picked "1 a) Is the number of petitions with Data Engineer job title increasing over time?";
	
		hadoop jar /home/hduser/Project_package/MapReduce_jar/question_1a.jar /Project-Data/h1b /project_MapReduce/question1a
	
        show_menu;
        ;;

        2) clear;
        option_picked "1 b) Top 5 job titles who are having highest average growth in applications";

		hadoop jar /home/hduser/Project_package/MapReduce_jar/question_1b.jar /Project-Data/h1b /project_MapReduce/question1b
	
        show_menu;
        ;; 
        3) clear;
        option_picked "2 a) Which part of the US has the most Data Engineer jobs for each year?";
		echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
		echo "part of the US has the most Data Engineer jobs for this year";
	    hive -e "use Project_Main; SELECT split(worksite,'[,]')[1] as state,COUNT(case_status) AS number_of_petition,year from h1b_final WHERE job_title LIKE 'DATA ENGINEER' and year=$var GROUP BY split(worksite,'[,]')[1], year ORDER BY number_of_petition desc limit 1;"
        show_menu;
        ;;

	4) clear;
        option_picked "2 b) find top 5 locations in the US who have got certified visa for each year.";
        	echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
             echo "top 5 locations in the US who have got certified visa for this year";
	    hive -e "use Project_Main;  SELECT split(worksite,'[,]')[0] as city, year, COUNT(case_status) AS number_of_petition from h1b_final WHERE case_status='CERTIFIED' and year=$var GROUP BY year, split(worksite,'[,]')[0] ORDER BY number_of_petition desc limit 5;"
       show_menu;
        ;;  

	5) clear;
        option_picked "3) Which industry has the most number of Data Scientist positions?";
             echo "The Industry which has the most number of Data Scientist positions:";
	    hive -e "use Project_Main; select soc_name , COUNT(soc_name) AS C from h1b_final where job_title LIKE 'DATA SCIENTIST' group by soc_name order by C desc LIMIT 1;"
       show_menu;
        ;;

        6) clear;
        option_picked "4)Which top 5 employers file the most petitions each year?";
             echo "top 5 employers file the most petitions each year";
		pig /home/hduser/Project_package/Pig_Scripts/Q4.pig
         show_menu;
        ;;

        7) clear;
        option_picked "5) Find the most popular top 10 job positions for H1B visa applications for each year (all applications)?";
		pig /home/hduser/Project_package/Pig_Scripts/Q5a.pig
        show_menu;
        ;;

        8) clear;
        option_picked "5) Find the most popular top 10 job positions for H1B visa applications for each year (only certified applications)?";
		pig /home/hduser/Project_package/Pig_Scripts/Q5b.pig
        show_menu;
        ;;

        9) clear;
		option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.";
              echo "The percentage and the count of each case status on total applications for each year:";
	    hive -e "use Project_Main; select round((SUM(case case_status when 'CERTIFIED' then 1 end)/count(case_status))*100,2) as CERTIFIED, round((SUM(case case_status when 'CERTIFIED-WITHDRAWN' then 1 end)/count(case_status))*100,2) as CERTIFIED_WITHDRAWN, round((SUM(case case_status when 'WITHDRAWN' then 1 end)/count(case_status))*100,2) as WITHDRAWN, round((SUM(case case_status when 'DENIED' then 1 end)/count(case_status))*100,2) as DENIED, year from h1b_final group by year order by year;"
        show_menu;
        ;;

	10) clear;
        option_picked "7) Create a bar graph to depict the number of applications for each year";
              echo "The number of applications for each year:";
	    hive -e "use Project_Main; select year, COUNT(year) as number_of_applications from h1b_final group by year order by year;"
        show_menu;
        ;;

	11) clear;
        option_picked "8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order";
        echo -e "${MENU}Select One Option From Below${NORMAL}"
        echo -e "${MENU}**${NUMBER} 1)${MENU} Full time job${NORMAL}"
        echo -e "${MENU}**${NUMBER} 2)${MENU} Part time job ${NORMAL}"
	        read n
	    case $n in
                1)	echo "Full time"
                    pig /home/hduser/Project_package/Pig_Scripts/Q8-full.pig
                    ;;		
                    
                2) 	echo "Part time"
                   pig /home/hduser/Project_package/Pig_Scripts/Q8-part.pig
                    ;;
 
                *) echo "Please Select one among the option[1 or 2]";;
                esac
        show_menu;
        ;;

	12) clear;
	option_picked "9) Which are   employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?"
		hadoop jar /home/hduser/Project_package/MapReduce_jar/question_9.jar /Project-Data/h1b /project_MapReduce/question9
        show_menu;
        ;;
	
	13) clear;
	option_picked "10) Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?"
		hadoop jar /home/hduser/Project_package/MapReduce_jar/question_10.jar /Project-Data/h1b /project_MapReduce/question10
        show_menu;
        ;;

	14) clear;
	option_picked "11) Export result for question no 10 to MySql database."
		mysql -u root -p'933668' -e 'drop database question11;create database if not exists question11;use question11;create table question11(job_title varchar(100),petitions int,success_rate float);';

		sqoop export --connect jdbc:mysql://localhost/question11 --username root --password '933668' --table question11 --update-mode allowinsert  --export-dir /project_MapReduce/question10/p* --input-fields-terminated-by '\"' ;

		echo -e '\n\nContents Exported to MySQL Database:\n\n'

		mysql -u root -p'933668' -e 'select * from question11.question11';
        show_menu;
        ;;

		\n) exit;   
	;;
        
	*) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done
