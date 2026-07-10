CREATE Database food_delivery;
Use food_delivery;

-- Data Quality Assessment and Data Cleaning
Select * From food_delivery;
Desc food_delivery;

Alter Table food_delivery
Rename Column ï»¿ID to Id;
Show Columns from food_delivery;

ALTER TABLE food_delivery
RENAME COLUMN `Time_taken(min)` TO Time_taken_min;


-- Duplicate Records checking
Select Id ,
COUNT(*) as Duplicate_Count
From food_delivery 
group by Id Having COUNT(*) >1;

-- Missing Value Checking
SELECT
SUM(CASE WHEN Delivery_person_Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
SUM(CASE WHEN Delivery_person_Ratings IS NULL THEN 1 ELSE 0 END) AS Missing_Ratings,
SUM(CASE WHEN Type_of_order IS NULL THEN 1 ELSE 0 END) AS Missing_Order_Type,
SUM(CASE WHEN Type_of_vehicle IS NULL THEN 1 ELSE 0 END) AS Missing_Vehicle,
SUM(CASE WHEN Id IS NULL THEN 1 ELSE 0 END) As Missing_ID
FROM food_delivery;

-- Checking Distinct values
SELECT DISTINCT Type_of_order From food_delivery;
SELECT DISTINCT Type_of_vehicle From food_delivery;

-- Checking Age and time  Range
SELECT Max(Delivery_person_Age)  as Max_age , Min(Delivery_person_Age) as Min_age From food_delivery;
SELECT Max(Time_taken_min) as Max_time , Min(Time_taken_min) as Min_time , Avg(Time_taken_min) as Avg_time From food_delivery;

-- Ouliers age
Select * From food_delivery 
Where Delivery_person_Age <18 OR Delivery_person_age > 60;

-- Removing Leading and trailing spaces 
Set Sql_Safe_Updates = 0;
Update food_delivery SET Type_of_order = TRIM(Type_of_order);
Update food_delivery SET Type_of_vehicle = TRIM(Type_of_vehicle);

