-- SQL PROJECT sindhura nk
create database csvsession1;

use csvsession1;

show variables like 'secure_file_priv';

create table olympics
(
ID int,
Name varchar(300),
Sex char(1),
Age int,
Height int,
Weight int,
Team varchar(400),
NOC varchar(400),
Games varchar(400),
Year int,
Season varchar(400),
City varchar(400),
Sport varchar(400),
Event varchar(400),
Medal varchar(400)

);

-- 
select  * from olympics;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/Athletes_Cleaned.csv'
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows; -- since we have already created column names

select * from olympics
limit 5;

-- view data where medal is gold
select * from olympics
where medal='gold';

select * from olympics
limit 5;

-- 1. Show how many medal counts present for entire data
select medal,count(*) as medalcount from olympics
group by medal;

select count(medal) from olympics;

-- 2. Show count of unique sports present in Olympics
select sport,count(*) as uniqueSportCount from olympics
group by sport;

-- 3. Show how many different medals won by team India
select team,games,year,sport,medal from olympics
where team='india' and medal in ('gold','bronze','silver');

-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select event,team,year,medal from olympics
where team='india' and medal !='nomedal'
order by case 
when medal='silver' then 30
when medal='bronze' then 20
when medal='gold' then 10
else 100 end;

-- 5. Show event wise medals won by India in order of year
select event,team,year,medal from olympics
where team='india' 
order by year;

-- 6. show country who won maximum medals.
select team,count(*) as medalCount from olympics
where medal!='nomedal'
group by team
order by medalCount desc
limit 1;

-- 7.show top 10 countries whowon gold
select team,medal,count(*) as medalCount from olympics
where medal='gold'
group by team
order by medalCount desc
limit 10;

--  8. show in which year did United states won most gold medal
select team,medal,year,count(*) as medalCount from olympics
where team='United States' and medal='gold'
group by year,medal
order by medalCount desc
limit 1;


-- 9. In which sports United States has most medals.
select team,sport,count(*) as medalCount from olympics
where team='United States' and medal!='nomedal'
group by sport
order by medalCount desc
limit 3;

-- 10. Find top three players who won most medals along with their sports and country
select name,sport,team,count(*) as medalCount from olympics
where medal!='nomedal'
group by name,sport,team
order by medalCount desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.
select name,team,sport,medal,count(*) as medalCount from olympics
where medal='gold' and sport='cycling'
group by team,name
order by medalCount desc
limit 1;

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name,team,count(*) medalCount from olympics
where medal in('gold','silver','bronze') and sport='basketball'
group by name,team
order by medalCount desc
limit 1;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select name,medal,count(*) medalCount from olympics
where name='Teresa Edwards' and sport='basketball'
group by name,medal;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select sex,year,count(*) as medalCount from olympics
where medal!='nomedal'
group by sex,medal,year
order by year;


