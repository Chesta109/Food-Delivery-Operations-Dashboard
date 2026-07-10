-- Explaoratory Data Analysis

-- Total Number of Orders
SELECT COUNT(*) as Total_orders From food_delivery;
-- Total number of delivery partners
SELECT COUNT(DISTINCT Delivery_person_ID) as Total_Delivery_partners From food_delivery;
-- Average Delivery_Person_rating
SELECT ROUND(Avg(Delivery_person_Ratings),2)as Avg_Rating From food_delivery;
-- Different Order Types
 SELECT DISTINCT Type_of_order From food_delivery;
 -- Different Vehicle type
 SELECT DISTINCT Type_of_vehicle From food_delivery;
 -- Orders by vehicle type
 SELECT Type_of_vehicle , COUNT(*) as Total_orders 
 From food_delivery GROUP BY Type_of_vehicle ORDER BY Total_orders desc;
 -- Orders by Order type
 SELECT Type_of_order , COUNT(*) as Total_orders
 FROM food_delivery GROUP BY Type_of_order ORDER BY Total_orders desc;
 -- Time taken by Vehichle type
 SELECT Type_of_vehicle , AVG(Time_taken_min) as Time_taken
 FROM food_delivery GROUP BY Type_of_vehicle ORDER BY Time_taken desc;
 -- Average Delivery Time by Order type
 SELECT Type_of_order , AVG(Time_Taken_min) as Avg_time_taken
 From food_delivery GROUP BY Type_of_order ORDER BY Avg_time_taken desc;
 -- Top-10 Delivery Partners
 SELECT Delivery_person_ID , Delivery_person_Ratings From food_delivery
 ORDER BY Delivery_person_Ratings desc LIMIT 10;
-- Bottom-10 Delivery Partners
SELECT Delivery_person_ID , Delivery_person_Ratings From food_delivery
ORDER BY Delivery_person_Ratings LIMIT 10;
-- AGe Group Distribution
Select 
   CASE 
        WHEN Delivery_person_Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Delivery_person_Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Delivery_person_Age BETWEEN 34 AND 44 THEN '34-44'
        ELSE '45+'
        END AS Age_Group,
        COUNT(*) as Total_Delivery_Partners FROM food_delivery
        GROUP BY Age_Group ORDER BY Age_Group;