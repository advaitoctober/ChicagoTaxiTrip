use database chicagotaxidb;

DROP TABLE IF EXISTS c_taxi;

--before running the create table sql command , run the gc in Linux to remove the $ sign.

CREATE TABLE c_taxi (
  Trip_ID varchar(40) ,
  Taxi_ID varchar(128),
  Trip_Start_Timestamp varchar(22) DEFAULT NULL,
  Trip_End_Timestamp varchar(22) DEFAULT NULL,
  Trip_Seconds int(11) DEFAULT NULL,
  Trip_Miles double DEFAULT NULL,
  Pickup_Census_Tract varchar(11) DEFAULT NULL,
  Dropoff_Census_Tract varchar(11) DEFAULT NULL,
  Pickup_Community_Area int(11) DEFAULT NULL,
  Dropoff_Community_Area int(11) DEFAULT NULL,
  Fare double DEFAULT NULL,
  Tips double DEFAULT NULL,
  Tolls double DEFAULT NULL,
  Extras double DEFAULT NULL,
  Trip_Total double DEFAULT NULL,
  Payment_Type varchar(11) DEFAULT NULL,
  Company varchar(50) DEFAULT NULL,
  Pickup_Centroid_Latitude double DEFAULT NULL,
  Pickup_Centroid_Longitude double DEFAULT NULL,
  Pickup_Centroid_Location double DEFAULT NULL,
  Dropoff_Centroid_Latitude double DEFAULT NULL,
  Dropoff_Centroid_Longitude double DEFAULT NULL,
  Dropoff_Centroid_Location double DEFAULT NULL,
)

--loading the data 
LOAD DATA LOCAL INFILE 'C:/DragonBallZ/Fall2017/Prof_Chandola/Project/Taxi_Trips.csv' INTO TABLE c_taxi FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES;

--deleting entries 
delete from c_taxi where Trip_Miles = 0 OR Trip_Seconds = 0 OR Pickup_Community_Area=0 OR Dropoff_Community_Area=0 OR Company IS NULL OR fare = 0 OR Trip_Total = 0 OR 
Pickup_Centroid_Latitude IS NULL OR Pickup_Centroid_Longitude IS NULL OR Dropoff_Centroid_Latitude IS NULL OR Dropoff_Centroid_Longitude IS NULL;


delete from c_taxi where Trip_Seconds > 3600 OR Trip_Miles > 50;
delete from c_taxi where Company is null or Company = "";
delete from c_taxi where Pickup_Centroid_Latitude = 0 OR Pickup_Centroid_Longitude = 0 OR Dropoff_Centroid_Latitude = 0 or Dropoff_Centroid_Longitude = 0;

-- converting the datatype from string to date
UPDATE c_taxi SET Trip_Start_Timestamp = STR_TO_DATE(Trip_Start_Timestamp, '%m/%d/%Y %h:%i:%s %p'),
Trip_End_Timestamp = STR_TO_DATE(Trip_End_Timestamp, '%m/%d/%Y %h:%i:%s %p');

commit; 
          
         
--Indexes
CREATE INDEX pca ON c_taxi (Pickup_Community_Area);
CREATE INDEX dca ON c_taxi (Dropoff_Community_Area);
CREATE INDEX tid ON c_taxi (Taxi_ID);
CREATE INDEX tst ON c_taxi (Trip_Start_Timestamp);
CREATE INDEX ts ON c_taxi (Trip_Seconds);
CREATE INDEX tm ON c_taxi (Trip_Miles);
CREATE INDEX fr ON c_taxi (Fare);
CREATE INDEX tt ON c_taxi (Trip_Total);
CREATE INDEX cmp ON c_taxi (Company);

--Table creation
create table pickup_location as (
select Pickup_Community_Area,
avg(Pickup_Centroid_Latitude) as 'Avg_P_Lat' ,
avg(Pickup_Centroid_Longitude) as 'Avg_P_Long'
from c_taxi 
group by Pickup_Community_Area  );

create table dropoff_location as (
select Dropoff_Community_Area,
avg(Dropoff_Centroid_Latitude) as 'Avg_D_Lat' ,
avg(Dropoff_Centroid_Longitude) as 'Avg_D_Long'
from c_taxi 
group by Dropoff_Community_Area  );

--Dump
mysqldump chicagotaxidb c_taxi > c_taxi_final.sql

mysqldump -u root -h localhost -pMyNewPass chicagotaxidb c_taxi > c_taxi_final.sql

