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


-- converting the datatype from string to date
UPDATE c_taxi SET Trip_Start_Timestamp = STR_TO_DATE(Trip_Start_Timestamp, '%m/%d/%Y %h:%i:%s %p'),
Trip_End_Timestamp = STR_TO_DATE(Trip_End_Timestamp, '%m/%d/%Y %h:%i:%s %p');

commit; 
          
         
