#Varad
select count(1) from taxi_mini where fare < tolls;
select * from taxi_mini where fare < extras;

select Company,avg(fare/trip_miles), avg(fare/Trip_Seconds) from taxi_mini group by Company;
select Pickup_Community_Area,avg(fare/trip_miles), avg(fare/Trip_Seconds) from taxi_mini group by Pickup_Community_Area;

ALTER TABLE taxi_mini ADD INDEX (Pickup_Community_Area);

select avg(tips) from taxi_mini where tips < (2*fare);


select * from (select Company,avg(fare/trip_miles) as Fare_Rate, avg((fare/Trip_Seconds)*60) as Fare_Minute,avg(trip_miles) ,count(1) as No_Of_Trips from taxi_mini group by Company) cr where No_Of_Trips >100 order by Fare_Rate desc;


select Pickup_Community_Area,Company,count(1) as No_Of_Trips from taxi_mini where Company != 'Unknown' group by 
   Pickup_Community_Area,Company order by Pickup_Community_Area,No_Of_Trips desc  ;
   
   
select m.Pickup_Community_Area,n.Company,m.Max_Trips from (   
(select Pickup_Community_Area,max(No_Of_Trips) as Max_Trips from 
(select Pickup_Community_Area,Company,count(1) as No_Of_Trips from taxi_mini where Company != 'Unknown' group by 
   Pickup_Community_Area,Company order by Pickup_Community_Area,No_Of_Trips desc  ) a group by Pickup_Community_Area) m
   join (select Pickup_Community_Area,Company,count(1) as No_Of_Trips from taxi_mini where Company != 'Unknown' group by 
   Pickup_Community_Area,Company) n
   on (m.Pickup_Community_Area = n.Pickup_Community_Area and m.Max_Trips = n.No_Of_Trips))
   
   
   select pickup_community_area,dropoff_community_area,count(1) as No_Of_Trips 
from taxi_mini where hour(Trip_start_timestamp) between 15 and 20
group by pickup_community_area,dropoff_community_area 
order by No_Of_Trips desc
;
select max(trip_seconds) from taxi_mini order by trip_seconds desc limit 500

select max(trip_miles) from taxi_mini order by trip_seconds desc limit 500

select * from taxi_mini where trip_miles = 825.1
select * from taxi_mini where trip_seconds = 70947

create table test_load(
A varchar(10),
B int(10),
D varchar(100)
)



CREATE TABLE c_taxi (
  Taxi_ID varchar(128),
  Trip_Start_Timestamp varchar(22) DEFAULT NULL,
  Trip_End_Timestamp varchar(22) DEFAULT NULL,
  Trip_Seconds int(11) DEFAULT NULL,
  Trip_Miles double DEFAULT NULL,
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
  Dropoff_Centroid_Latitude double DEFAULT NULL,
  Dropoff_Centroid_Longitude double DEFAULT NULL
)


select * from c_taxi limit 10;

select count(1) from c_taxi where Trip_Miles = 0 OR Trip_Seconds = 0 OR Pickup_Community_Area=0 OR Dropoff_Community_Area=0 OR Company IS NULL OR fare = 0 OR Trip_Total = 0 OR 
Pickup_Centroid_Latitude IS NULL OR Pickup_Centroid_Longitude IS NULL OR Dropoff_Centroid_Latitude IS NULL OR Dropoff_Centroid_Longitude IS NULL;

select count(1) from c_taxi where Trip_Miles > 50
select count(1) from c_taxi where Trip_Seconds > 3600 OR Trip_Miles > 50

select distinct Payment_Type from c_taxi;
select distinct Company from c_taxi;
select count(1) from c_taxi where Company is null or Company = "";


select Pickup_Community_Area,avg(Pickup_Centroid_Latitude) as 'Avg_P_Lat' ,
(min(Pickup_Centroid_Latitude) + ((max(Pickup_Centroid_Latitude)-min(Pickup_Centroid_Latitude))/2)) as 'AVG',
min(Pickup_Centroid_Latitude) as 'MIN',
avg(Pickup_Centroid_Longitude) as 'Avg_P_Long'
from c_taxi 
group by Pickup_Community_Area  ;


select count(1) from c_taxi where Pickup_Centroid_Latitude = 0 OR Pickup_Centroid_Longitude = 0
OR Dropoff_Centroid_Latitude = 0 or Dropoff_Centroid_Longitude = 0;

select Dropoff_Community_Area,avg(Dropoff_Centroid_Latitude) as 'Avg_D_Lat' ,
avg(Dropoff_Centroid_Longitude) as 'Avg_D_Long'
from c_taxi 
group by Dropoff_Community_Area  ;



