# ChicagoTaxiTrip

UB EAS 503 Final project.

# Contributors:
## Varad Tupe varadsha@buffalo.edu
## Suhit Dutta suhitdat@buffalo.edu
## Advait Kulkarni advaitan@buffalo.edu

# Introduction
- The data was extracted from Chicago Data Portal
- Main dataset contains total of 113 Million records
- The data set used for analysis is from April - July 2017

# Data Description 

### Taxi Trip Data
| Column Name | Description | Type |
| :------ |:------ | :------ |
| Trip ID | A unique identifier for the trip. | Plain Text |
| Taxi ID | A unique identifier for the taxi. | Plain Text |
| Trip Start Timestamp | When the trip started, rounded to the nearest 15 minutes. | Date & Time |
| Trip End Timestamp | When the trip ended, rounded to the nearest 15 minutes. | Date & Time |
| Trip Seconds | Time of the trip in seconds. | Number |
| Trip Miles | Distance of the trip in miles. | Number |
| Pickup Census Tract | The Census Tract where the trip began. For privacy, this Census Tract is not shown for some trips. | Plain Text |
| Dropoff Census Tract | The Census Tract where the trip ended. For privacy, this Census Tract is not shown for some trips. | Plain Text |
| Pickup Community Area | The Community Area where the trip began. | Number |
| Dropoff Community Area | The Community Area where the trip ended. | Number |
| Fare | The fare for the trip. | Money |
| Tips | The tip for the trip. Cash tips generally will not be recorded. | Money |
| Tolls | The tolls for the trip. | Money |
| Extras | Extra charges for the trip. | Money |
| Trip Total | Total cost of the trip, the total of the previous columns. | Money |
| Payment Type | Type of payment for the trip. | Plain Text |
| Company | The taxi company. | Plain Text |
| Pickup Centroid Latitude | The latitude of the center of the pickup census tract or the community area if the census tract has been hidden for privacy. | Number |
| Pickup Centroid Longitude | The longitude of the center of the pickup census tract or the community area if the census tract has been hidden for privacy. | Number |
| Dropoff Centroid Latitude | The latitude of the center of the dropoff census tract or the community area if the census tract has been hidden for privacy. | Number |
| Dropoff Centroid Longitude | The longitude of the center of the dropoff census tract or the community area if the census tract has been hidden for privacy. | Number |

### Community Area
| Column Name | Description |
|:----|:----|
| Community Area | Number |
| Community Name | Text |

# Data Cleansing
### Following columns were dropped from dataset
-  Trip ID
-  Pickup Census Tract
-  Dropoff Census Tract
-  Pickup Centroid Location
-  Dropoff Centroid Location

### Records deletion

| Field | Deletion condition |
|------|------|
| Trip Miles | 0 and >= 50 |
| Trip Seconds | 0 and >= 3600 |
| Pickup Community Area | 0 or NULL |
| Dropoff Community Area | 0 or NULL |
| Fare | 0 |
| Pickup Centroid Latitude | NULL |
| Pickup Centroid Longitude | NULL |
| Dropoff Centroid Latitude | NULL |
| Dropoff Centroid Longitude | NULL |
|

### Post data cleansing the final data set consist of 1.5 million records


# Derived Tables

The data was grouped according to pickup community area and dropoff community area each seperately and the latitude and longitude. This would give us approximate centroid of the each community area.
#### Community area Location mapping table sample
| Community Area | Latitude | Longitude |
| ------ | ------ | ------ |
| 1 | 42.009506 | -87.670208 |
| 2 | 42.001556 | -87.695008 |
| 3 | 41.965685 | -87.655717 |
| 4 | 41.975091 | -87.687479 |
| 5 | 41.94784 | -87.683792 |

