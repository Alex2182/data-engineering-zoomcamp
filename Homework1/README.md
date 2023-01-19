#Homework1 spent ~3 hours

Docker part

```bash
echo "q1 answer: "
 3 docker build --help | grep '\--i' | grep 'id'
 4 echo "q2 answer: "
 5 docker run --rm python:3.9 pip list | grep "[0-9]*.[0-9]\$" | wc -l
```

Postgres part

```sql
--Create table with trips
create table green_taxi(
VendorID int,
lpep_pickup_datetime timestamp,
lpep_dropoff_datetime timestamp,
store_and_fwd_flag varchar(1),
RatecodeID int,
PULocationID int,
DOLocationID int,
passenger_count int,
trip_distance numeric,
fare_amount numeric,
extra numeric,
mta_tax numeric,
tip_amount numeric,
tolls_amount numeric,
ehail_fee numeric,
improvement_surcharge numeric,
total_amount numeric,
payment_type int,
trip_type int,
congestion_surcharge numeric)

--load data to table 1
psql -c "copy green_taxi from '/home/abonin/zoomcamp_course/hw1/green_tripdata_2019-01.csv' csv header;"
--Create table with Zones names
create table zones_taxi(
"LocationID" int,
"Borough" varchar,
"Zone" varchar,
"service_zone" varchar)

--load data to table 2
psql -c "copy zones_taxi from '/home/abonin/zoomcamp_course/hw1/taxi+_zone_lookup.csv' csv header;"

--q3 Count records
select
	count(*) as answer
from green_taxi
where lpep_pickup_datetime::date = lpep_dropoff_datetime::date and
lpep_dropoff_datetime::date = '2019-01-15';
--q4 Largest trip for each day
select
	lpep_pickup_datetime::date as answer,
	trip_distance
from green_taxi
order by 2 desc
limit 1;
--q5 The number of passengers
select
	passenger_count,
	count(*) as trips
from green_taxi
where lpep_pickup_datetime::date = '2019-01-01'
group by 1
having passenger_count in (2,3);
--q6 Largest tip
select
	z."Zone",
	g.tip_amount,
	(select "Zone" from zones_taxi where "LocationID"=g.dolocationid) as answer
from zones_taxi as z
join green_taxi as g
on z."LocationID"=g.pulocationid
where z."Zone" like '%Astoria%'
order by 2 desc
limit 1;
```
