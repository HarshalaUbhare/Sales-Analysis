SELECT * FROM saledata.`walmartsalesdata.csv`;
 
 
--  ----------------------------------------------------------Feature Engineering -----------------------------------------------------------------

-- 1. Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. 
-- This will help answer the question on which part of the day most sales are made.

SELECT Time,(
    CASE
    WHEN `Time` BETWEEN "00:00:00" AND "12:00:00" THEN "MORNING"
    WHEN `Time` BETWEEN "12:01:00" AND "16:00:00" THEN "AFTERNOON"
    ELSE "EVENING"
   END 
) AS Time_of_Day
FROM saledata.`walmartsalesdata.csv`;


ALTER TABLE `walmartsalesdata.csv` ADD COLUMN Time_of_Day VARCHAR(20);

SET SQL_SAFE_UPDATES=0;


UPDATE `walmartsalesdata.csv`
SET Time_of_Day= (
  CASE
    WHEN `Time` BETWEEN "00:00:00" AND "12:00:00" THEN "MORNING"
    WHEN `Time` BETWEEN "12:01:00" AND "16:00:00" THEN "AFTERNOON"
    ELSE "EVENING"
   END 
);
SELECT * FROM saledata.`walmartsalesdata.csv`;

-- 2. Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). 
-- This will help answer the question on which week of the day each branch is busiest.

SELECT Date , DAYNAME(Date) AS Day_of
FROM `walmartsalesdata.csv`;

ALTER TABLE `walmartsalesdata.csv` ADD COLUMN Day_of VARCHAR(10) ;

UPDATE `walmartsalesdata.csv`
SET Day_of = DAYNAME(Date);


-- 3. Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). 
-- Help determine which month of the year has the most sales and profit.

SELECT Date , monthname(Date) AS Month_name
FROM `walmartsalesdata.csv`;

ALTER TABLE `walmartsalesdata.csv` ADD COLUMN Month_name VARCHAR(10) ;

UPDATE `walmartsalesdata.csv`
SET Month_name = monthname(Date);

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------
--  ----------------------------------------Exploratory Data Analysis (EDA)------------------------------------
-- --------------------------------------------Generic Question--------------------------------------------

-- How many unique cities does the data have?
SELECT DISTINCT City FROM  `walmartsalesdata.csv`;

-- In which city is each branch?
SELECT DISTINCT City,Branch FROM  `walmartsalesdata.csv`;

-- --------------------------------------- Product --------------------------------------------------------
-- How many unique product-lines does the data have?
SELECT DISTINCT `Product line` FROM  `walmartsalesdata.csv`  LIMIT 0, 1000;

-- What is the most common payment method?
SELECT MAX(Payment) FROM `walmartsalesdata.csv`;

SELECT Payment, COUNT(Payment) AS Count
      FROM `walmartsalesdata.csv` 
          GROUP BY Payment
		  ORDER BY Count DESC;
          
          
-- What is the most selling product line?
SELECT `Product line`, COUNT(`Product line`) AS Count 
   FROM `walmartsalesdata.csv` 
     GROUP BY `Product line`;
     
-- What is the total revenue by month?
SELECT Month_name AS Month ,
	   SUM(Total) AS Total_revenue
    FROM `walmartsalesdata.csv` 
       GROUP BY Month
          ORDER BY Total_revenue DESC;
          
-- What month had the largest COGS(Cost of Goods Sold)?
SELECT Month_name AS Month, SUM(cogs) AS cogs_Count
    FROM `walmartsalesdata.csv` 
       GROUP BY Month
          ORDER BY cogs_Count DESC;

--  What product line had the largest revenue?
SELECT `Product Line` , SUM(Total) Count
   FROM `walmartsalesdata.csv` 
       GROUP BY `Product Line`
          ORDER BY Count DESC;


-- What is the city with the largest revenue?
SELECT City, SUM(Total) as total_revenue
 FROM `walmartsalesdata.csv`
   GROUP BY City
     ORDER BY total_revenue DESC;
     
-- What product line had the largest VAT?
SELECT `Product line` AS product_line, AVG(`Tax 5%`) AS VAT
     FROM `walmartsalesdata.csv`
         GROUP BY `Product line`
            ORDER BY VAT DESC;
-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

    
SELECT `Product line`, SUM(Quantity) AS TotalSales,
    CASE
        WHEN SUM(Quantity) > (SELECT AVG(Quantity) FROM `walmartsalesdata.csv`) THEN 'Good'
        ELSE 'Bad'
    END 
    AS SalesCategory
FROM `walmartsalesdata.csv`
GROUP BY `Product line`;

      
-- Which branch sold more products than average product sold?
 SELECT AVG(Quantity) FROM `walmartsalesdata.csv`;
 
 SELECT  Branch, SUM(Quantity) AS qty
  FROM `walmartsalesdata.csv`
  GROUP BY Branch
  HAVING SUM(Quantity) >(SELECT AVG(Quantity) FROM `walmartsalesdata.csv`);


-- What is the most common product line by gender?
SELECT Gender, `Product line`
    FROM `walmartsalesdata.csv`
    GROUP BY Gender, `Product line`
    ORDER BY `Product line` DESC;
    
-- What is the average rating of each product line?
SELECT  `Product line`, ROUND(AVG(Rating),2) AS RET
  FROM `walmartsalesdata.csv`
   GROUP BY `Product line`
     ORDER BY RET DESC;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  ---------------------------------------------Sales------------------------------------------------------------------------------------------
-- Number of sales made in each time of the day per weekday
-- Which of the customer types brings the most revenue?
-- Which city has the largest tax percent/ VAT (Value Added Tax)?
-- Which customer type pays the most in VAT?


