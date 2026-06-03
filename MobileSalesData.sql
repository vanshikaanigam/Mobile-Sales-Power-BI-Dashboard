#Q1. Which mobile brands generate the highest revenue?
#Business Question: Identify the most profitable brands.

SELECT Brand,
       SUM(Units_Sold * Price_Per_Unit) AS Revenue
FROM MobileSalesData
GROUP BY Brand
ORDER BY Revenue DESC;

#Q2. Which cities contribute the most revenue?
#Business Question: Find the strongest sales markets.

SELECT City,
       SUM(Units_Sold * Price_Per_Unit) AS Revenue
FROM MobileSalesData
GROUP BY City
ORDER BY Revenue DESC;

#Q3. How do sales perform month-over-month?
#Business Question: Analyze sales trends and seasonality.

SELECT Month,
       SUM(Units_Sold * Price_Per_Unit) AS Revenue
FROM MobileSalesData
GROUP BY Month
ORDER BY Month;

#Q4. Which mobile models are sold the most?
#Business Question: Identify best-selling products.

SELECT Mobile_Model,
       SUM(Units_Sold) AS Total_Units_Sold
FROM MobileSalesData
GROUP BY Mobile_Model
ORDER BY Total_Units_Sold DESC;

#Q5. Which payment methods are preferred by customers?
#Business Question: Understand customer payment behavior.

SELECT Payment_Method,
       COUNT(*) AS Total_Transactions
FROM MobileSalesData
GROUP BY Payment_Method
ORDER BY Total_Transactions DESC;

#Q6. Which age group contributes the most revenue?
#Business Question: Identify the most valuable customer segment.

SELECT
CASE
    WHEN Customer_Age < 25 THEN '18-24'
    WHEN Customer_Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Customer_Age BETWEEN 35 AND 44 THEN '35-44'
    ELSE '45+'
END AS Age_Group,
SUM(Units_Sold * Price_Per_Unit) AS Revenue
FROM MobileSalesData
GROUP BY Age_Group
ORDER BY Revenue DESC;

#Q7. On which day of the week are sales highest?
#Business Question: Determine peak sales days.

SELECT Day_Name,
       SUM(Units_Sold * Price_Per_Unit) AS Revenue
FROM MobileSalesData
GROUP BY Day_Name
ORDER BY Revenue DESC;

#Q8. Which brands receive the highest customer ratings?
#Business Question: Measure customer satisfaction by brand.

SELECT Brand,
       ROUND(AVG(Customer_Ratings),2) AS Avg_Rating
FROM MobileSalesData
GROUP BY Brand
ORDER BY Avg_Rating DESC;

#Q9. Who are the top 10 customers by spending?
#Business Question: Identify high-value customers.

SELECT Customer_Name,
       SUM(Units_Sold * Price_Per_Unit) AS Total_Spending
FROM MobileSalesData
GROUP BY Customer_Name
ORDER BY Total_Spending DESC
LIMIT 10;

#Q10. Which brands perform best in each city?
#Business Question: Discover regional brand preferences.

SELECT City,
       Brand,
       SUM(Units_Sold * Price_Per_Unit) AS Revenue
FROM MobileSalesData
GROUP BY City, Brand
ORDER BY City, Revenue DESC;