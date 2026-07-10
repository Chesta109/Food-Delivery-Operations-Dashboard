-- Which vehicle type delievers the fastest
SELECT Type_of_vehicle , AVG(Time_taken_min) as Avg_time_taken 
FROM food_delivery Group by Type_of_vehicle ORDER BY AVg_time_taken LIMIT 1;

-- Which Order Type takes the longest time
SELECT Type_of_order , AVG(Time_taken_min) as Avg_time_taken 
From food_delivery GROUP BY Type_of_order ORDER BY Avg_time_taken desc LIMIT 1;

-- Does Rating effects Delivery Time
SELECT
  CASE 
     WHEN Delivery_person_Ratings >=4.8 THEN 'Excellent'
     WHEN Delivery_person_Ratings >= 4.5 THEN 'Good'
     WHEN Delivery_person_Ratings >= 4 Then 'Average'
     ELSE 'Poor'
     END AS Rating_Category ,
	ROUND(AVG(Time_taken_min),2) AS Avg_time_taken From food_delivery
    GROUP BY Rating_Category ORDER BY Avg_time_taken;
 
--  Which Age Group performs the best
SELECT 
  CASE 
   WHEN Delivery_person_Age BETWEEN 18 AND 24 THEN '18-24'
   WHEN Delivery_person_Age BETWEEN 25 AND 34 THEN '25-34'
   WHEN Delivery_person_Age BETWEEN 35 AND 44 THEN '35-44'
ELSE '45+'
END AS Age_Group,
ROUND(AVG(Time_taken_min),2) as Avg_time_taken FROM food_delivery
GROUP BY Age_Group ORDER BY Avg_time_taken;

-- Which Order type has the highest rating
Select Type_of_order, ROUND(AVG(Delivery_person_Ratings),2) as Avg_ratings FROM food_delivery
GROUP BY Type_of_order ORDER BY Avg_ratings desc ;

-- Which Delivery Partners Complted the most orders
SELECT Delivery_person_ID , COUNT(*) as Total_orders FROM food_delivery 
GROUP BY Delivery_person_ID ORDER BY Total_orders desc ;

-- Delivery Performance Category
SELECT 
  CASE 
     WHEN Time_taken_min <= 20 THEN 'Fast'
     WHEN Time_taken_min BETWEEN 20 AND 35 THEN 'Average'
     ELSE 'Slow'
     END AS Delivery_Status,
     COUNT(*) as Total_orders
     FROM food_delivery GROUP BY Delivery_Status;
     
-- Which vehicle has the highest fast deliveries 
SELECT  Type_of_vehicle , COUNT(*) as Fast_Deliveries From food_delivery
WHERE Time_taken_min <20 GROUP BY Type_of_vehicle ORDER BY Fast_Deliveries desc LIMIT 1;

-- Ranking Delivery Partner based on Rating
SELECT Delivery_person_ID , Delivery_person_Ratings ,
RANK() OVER(ORDER BY Delivery_person_Ratings desc) as Rating_Rank FROM food_delivery;

-- Ranking Vehicle Type based on rating
SELECT Type_of_vehicle , ROUND(AVG(Time_taken_min),2) as Avg_time,
RANK() OVER(Order BY AVG(Time_taken_min)) as Vehicle_Ranking
FROM food_Delivery
GROUP BY Type_of_vehicle;

-- CTE Example
WITH VehiclePerformance as (   
SELECT Type_of_vehicle , 
ROUND(AVG(Time_taken_min) ,2) as Avg_time 
From food_delivery
GROUP BY type_of_vehicle
)
SELECT * FROM VehiclePerformance WHERE Avg_time <30;