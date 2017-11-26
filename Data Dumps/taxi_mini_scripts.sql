-- to pick only the first 2 lakh entries
--Get-Content "C:\DragonBallZ\Fall2017\Prof_Chandola\Project\Taxi_Trips.csv" | select -First 200000 | Out-File "C:\DragonBallZ\Fall2017\Prof_Chandola\Project\Taxi_Mini.csv"

--loading data
LOAD DATA LOCAL INFILE 'C:/DragonBallZ/Fall2017/Prof_Chandola/Project/Taxi_Mini.csv' INTO TABLE taxi_mini FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES;

--deleting entries 
delete from taxi_mini where Trip_Miles = 0 OR Trip_Seconds = 0 ;


--removing the $ symbol 
update taxi_mini set Fare = substring(Fare,2) , Tips = substring(Tips,2) , 
Tolls = substring(Tolls,2), Extras = substring(Extras,2) ,
Trip_Total = substring(Trip_Total,2); 

--modifying the datatype 
alter table taxi_mini 
CHANGE  Fare Fare double , 
CHANGE Tips Tips double, 
CHANGE Tolls Tolls double , 
CHANGE Extras Extras double ,
CHANGE  Trip_Total Trip_Total double;

-- converting the datatype from string to date
UPDATE taxi_mini SET Trip_Start_Timestamp = STR_TO_DATE(Trip_Start_Timestamp, '%m/%d/%Y %h:%i:%s %p'),
Trip_End_Timestamp = STR_TO_DATE(Trip_End_Timestamp, '%m/%d/%Y %h:%i:%s %p');

update taxi_mini set Company = "Unknown" where Company = "" or Company is null;

commit; 