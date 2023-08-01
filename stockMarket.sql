-- CREATING DATABASE `ASSIGNMENT`

CREATE DATABASE Assignment;

-- USING ASSIGNMENT TO RUN FURTHER OPERATIONS

use Assignment;

-- TO SHOW TABLES 

show tables;

-- CREATING TABLE FOR STOCKS ( SAME IS TO BE DONE FOR EACH STOCK )

-- Names of the tables which is to be created in the database:- 

-- 1.Bajaj, 2.Eicher Motors 3.Hero Motocorp, 4.Infosys, 5.TCS, 6.TVS Motors --

create table TCS -- DATA IS IMPORTED FROM THE GIVEN .CSV OF STOCK COMPANIES 
     (
     
     -- VARCHAR DATA TYPE FOR date1
     
     date1 VARCHAR(50),
     
     -- FLOAT DATA TYPE FOR close_price 
     
     close_price float
     
     );
     
create table `Bajaj Auto`
     (
     
     date1 VARCHAR(50),
     
     close_price float
     
     );
     
create table `TVS Motors`
     (
     
     date1 VARCHAR(50),
     
     close_price float
     
     );
     
create table Infosys
     (
     
     date1 VARCHAR(50),
     
     close_price float
     
     );
     
create table `Eicher Motors`
     (
     
     date1 VARCHAR(50),
     
     close_price float
     
     );
     
create table `Hero Motocorp`
     (
     
     date1 VARCHAR(50),
     
     close_price float
     
     );
 
--  WE IMPORTED DATA IN SQL USING `TABLE DATA IMPORT WIZARD` IN MYSQL WORKBENCH 

--  CHANGING DATE FORMAT FOR EACH TABLE FROM ("DD-MMM-YY") TO ("DD-MM-YYYY") 

--  DISABLING BY PUTTING SET_SAFE_UPDATES TO ZERO TO CHANGE FORMAT OF DATE 
  
set SQL_SAFE_UPDATES = 0;

-- The UPDATE statement is used to modify the existing records in a table

UPDATE `Bajaj Auto`

SET `date1` = STR_TO_DATE(`date1`,'%d-%M-%Y');

UPDATE TCS

SET `date1` = STR_TO_DATE(`date1`,'%d-%M-%Y');

UPDATE `TVS Motors`

SET `date1` = STR_TO_DATE(`date1`,'%d-%M-%Y');

UPDATE `Hero Motocorp`

SET `date1` = STR_TO_DATE(`date1`,'%d-%M-%Y');

UPDATE `Eicher Motors`

SET `date1` = STR_TO_DATE(`date1`,'%d-%M-%Y');

UPDATE Infosys

SET `date1` = STR_TO_DATE(`date1`,'%d-%M-%Y');

--   ENABLING BY PUTTING SET_SAFE_UPDATES TO ONE AFTER CHANF=GING THE FORMAT

set SQL_SAFE_UPDATES = 1;

-- FOR BAJAJ

select * from `Bajaj Auto`;

-- CREATING TABLE bajaj1 FROM TABLE tb_bajaj

-- THE  OVER KEYWORD SIGANALS A WINDOWING FUNCTION
  
CREATE TABLE bajaj1 as
 
select `Date1` as `Date`,`Close_Price` as `Close Price`,

CASE WHEN

-- USING row_number TO SELECT ROWS AFTER AND INCLUDING 20 

-- The ROW_NUMBER() is a window function that assigns a sequential integer to each row within the partition of a result set. 

	ROW_NUMBER() OVER w >= 20 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 20 PRECEDING) 
        
	ELSE NULL 
    
END AS `20 Day MA`,

CASE WHEN 

-- USING row_number TO SELECT ROWS AFTER AND INCLUDING 50 

	ROW_NUMBER() OVER w >= 50 THEN 
    
         avg(`Close_Price`) over(order by Date1 desc ROWS 50 PRECEDING) 
        
	ELSE NULL 
    
END AS `50 Day MA`

from `Bajaj Auto`

-- The ORDER BY keyword is used to sort the result-set in ascending or descending order. 

-- The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

-- Window functions operate on a set of rows and return a single aggregated value for each row.
 
-- The term Window describes the set of rows in the database on which the function will operate.

-- We define the Window (set of rows on which functions operates) using an OVER() clause.

window w as (ORDER BY Date1 desc) ;

-- TO SHOW ALL DATA IN bajaj1 

select * from bajaj1;

-- FOR TCS

-- The SQL CREATE TABLE Statement. The CREATE TABLE statement is used to create a new table in a database

CREATE TABLE tcs1 as
 
select `Date1` as `Date`,`Close_Price` as `Close Price`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 20 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 20 PRECEDING) 
        
	ELSE NULL 
    
END AS `20 Day MA`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 50 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 50 PRECEDING) 
        
	ELSE NULL 
    
END AS `50 Day MA`

from TCS

window w as (ORDER BY Date1 desc) ;


select * from tcs1;  

-- FOR TVS 
 
CREATE TABLE tvs1 as
 
select `Date1` as `Date`,`Close_Price` as `Close Price`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 20 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 20 PRECEDING) 
        
	ELSE NULL 
    
END AS `20 Day MA`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 50 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 50 PRECEDING)
        
	ELSE NULL 
    
END AS `50 Day MA`

from `TVS Motors`

window w as (ORDER BY Date1 desc) ;
   
select * from tvs1;
 
-- FOR EICHER

CREATE TABLE eicher1 as
 
select `Date1` as `Date`,`Close_Price` as `Close Price`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 20 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 20 PRECEDING) 
        
	ELSE NULL 
    
END AS `20 Day MA`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 50 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 50 PRECEDING) 
        
	ELSE NULL 
    
END AS `50 Day MA`

from `Eicher Motors`

window w as (ORDER BY Date1 desc) ;
    
select * from eicher1;

-- FOR INFOSYS
      
CREATE TABLE infosys1 as 

select `Date1` as `Date`,`Close_Price` as `Close Price`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 20 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 20 PRECEDING) 
        
	ELSE NULL 
    
END AS `20 Day MA`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 50 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 50 PRECEDING)
        
	ELSE NULL 
    
END AS `50 Day MA`

from Infosys

window w as (ORDER BY Date1 desc) ;    

select * from infosys1;
     
-- FOR HERO      

CREATE TABLE hero1 as

select `Date1` as `Date`,`Close_Price` as `Close Price`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 20 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 20 PRECEDING) 
        
	ELSE NULL 
    
END AS `20 Day MA`,

CASE WHEN 

	ROW_NUMBER() OVER w >= 50 THEN 
    
		avg(`Close_Price`) over(order by Date1 desc ROWS 50 PRECEDING) 
        
	ELSE NULL 
    
END AS `50 Day MA`

from `Hero Motocorp`

window w as (ORDER BY Date1 desc) ;

select * from hero1;

-- CREATING MASTER TABLE  

-- INNER JOIN (The INNER JOIN creates a new result table by combining column values of two tables) 

-- The keyword AS is used to assign an alias to the column or a table.
 
-- It is inserted between the column name and the column alias or between the table name and the table alias.

create table `Master Table` as 

select b.`Date` ,

b.`Close Price` as Bajaj,

tc.`Close Price`as TCS,

tv.`Close Price`as TVS,

i.`Close Price`as Infosys,

e.`Close Price`as Eicher,

h.`Close Price` as Hero

from bajaj1 b

inner join tcs1 tc using(`Date`)

inner join tvs1 tv using(`Date`)

inner join infosys1 i using(`Date`)

inner join eicher1 e using(`Date`)

inner join hero1 h using(`Date`);


select * from `Master table`;

-- CREATE TABLE bajaj2

-- USINNG LIMIT TO SELECT ALL ROWS BETWEEN [50,889] 

CREATE TABLE bajaj2 as 

select `Date`,`Close Price`,  
              
CASE 

   when `20 Day MA` > `50 Day MA` then "BUY"
  
   when `20 Day MA` < `50 Day MA` then "SELL"
   
   else "hold"
   
End as `Signal`
 
from bajaj1
 
order by `Date` desc

-- The SQL SELECT LIMIT statement is used to retrieve records from one or more tables 

-- in a database and limit the number of records returned based on a limit value
 
limit 49 , 889 ;

select * from bajaj2 ;

-- CREATE TABLE eicher2

CREATE TABLE eicher2 as 

select `Date`,`Close Price`,
                
CASE 

   when `20 Day MA` > `50 Day MA` then "BUY"
  
   when `20 Day MA` < `50 Day MA` then "SELL"
   
   else "hold"
   
End as `Signal`
 
from eicher1

order by `Date` desc

limit 49 , 889 ;

select * from eicher2;

-- CREATE TABLE hero2

CREATE TABLE hero2 as 

select `Date`,`Close Price`,
                
CASE 

   when `20 Day MA` > `50 Day MA` then "BUY"
   
   when `20 Day MA` < `50 Day MA` then "SELL"
   
   else "hold"
   
End as `Signal`

from hero1

order by `Date` desc

limit 49 , 889 ;

select * from hero2;

-- CREATE TABLE infosys2

CREATE TABLE infosys2 as 

select `Date`,`Close Price`, 
               
CASE 

   when `20 Day MA` > `50 Day MA` then "BUY"
   
   when `20 Day MA` < `50 Day MA` then "SELL"
   
   else "hold"
   
End as `Signal`

from infosys1

order by `Date` desc

limit 49 , 889 ;

select * from infosys2;

-- CREATE TABLE tcs2

CREATE TABLE tcs2 as 

select `Date`,`Close Price`,
                
CASE 

   when `20 Day MA` > `50 Day MA` then "BUY"
   
   when `20 Day MA` < `50 Day MA` then "SELL"
   
   else "hold"
   
End as `Signal`

from tcs1

order by `Date` desc

limit 49 , 889 ;

select * from tcs2;

-- CREATE TABLE tvs2

-- The SQL CASE Statement

-- The CASE statement goes through conditions and returns a value when the first condition is met (like an IF-THEN-ELSE statement).
 
-- So, once a condition is true, it will stop reading and return the result. 

-- If no conditions are true, it returns the value in the ELSE clause

CREATE TABLE tvs2 as 

select `Date`,`Close Price`, 
               
CASE 

   when `20 Day MA` > `50 Day MA` then "BUY"
  
   when `20 Day MA` < `50 Day MA` then "SELL"
  
   else "hold"
   
End as `Signal`

from tvs1

order by `Date` desc

limit 49 , 889 ;

select * from tvs2;

--     USER DEFINED FUNCTION FOR BAJAJ STOCK

-- A function is a database object in SQL Server. Basically, it is a set of SQL statements that accept only input parameters, 

-- perform actions and return the result. 

-- A function can return an only a single value or a table 

create function `Signal For Date`(date1 datetime)

returns varchar(4) deterministic

return  (
        select `signal`
        
		from bajaj2 
        
        where date =date1
	    );

--       CALLING UDF FOR DATE ("2018-04-23")

select `signal for date`("2018-04-23");


--                 THE END 
--            THANKS FOR READING  
