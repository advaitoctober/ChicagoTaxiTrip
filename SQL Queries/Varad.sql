#Varad
select count(1) from taxi_mini where fare < tolls;
select * from taxi_mini where fare < extras;

select Company,avg(fare/trip_miles), avg(fare/Trip_Seconds) from taxi_mini group by Company;
select Pickup_Community_Area,avg(fare/trip_miles), avg(fare/Trip_Seconds) from taxi_mini group by Pickup_Community_Area;

ALTER TABLE taxi_mini ADD INDEX (Pickup_Community_Area);

select avg(tips) from taxi_mini where tips < (2*fare);