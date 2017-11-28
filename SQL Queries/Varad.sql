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