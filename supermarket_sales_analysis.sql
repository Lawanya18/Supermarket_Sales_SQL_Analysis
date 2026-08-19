-- ============================================================
-- PROJECT 3: SUPERMARKET SALES ANALYSIS
-- Database: supermarket_sales
-- Dataset: Supermarket Sales
-- Period: Q1 2019
-- Rows: 1,000
-- ============================================================


-- ============================================================
-- 1. DATA QUALITY CHECKS
-- ============================================================

-- 1.1 Total records
SELECT COUNT(*) AS Total_Rows
FROM supermarket_sales;


-- 1.2 Duplicate Invoice IDs
SELECT
    Invoice_ID,
    COUNT(*) AS Duplicate_Count
FROM supermarket_sales
GROUP BY Invoice_ID
HAVING COUNT(*) > 1;


-- 1.3 Date range
SELECT
    MIN(Date) AS First_Transaction,
    MAX(Date) AS Last_Transaction
FROM supermarket_sales;


-- 1.4 Missing values
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Customer_Rating) AS Valid_Ratings,
    COUNT(*) - COUNT(Customer_Rating) AS Missing_Ratings,
    COUNT(Payment) AS Valid_Payments,
    COUNT(*) - COUNT(Payment) AS Missing_Payments
FROM supermarket_sales;

-- ============================================================
-- 2. OVERALL BUSINESS PERFORMANCE
-- ============================================================

SELECT
    SUM(Total_Sales) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(Gross_Income) AS Total_Gross_Income
FROM supermarket_sales;

-- ============================================================
-- 3. PRODUCT PERFORMANCE
-- ============================================================

-- 3.1 Product line sales
SELECT
    Product_Line,
    SUM(Total_Sales) AS Total_Sales
FROM supermarket_sales
GROUP BY Product_Line
ORDER BY Total_Sales DESC;


-- 3.2 Product line profitability
SELECT
    Product_Line,
    SUM(Gross_Income) AS Gross_Income
FROM supermarket_sales
GROUP BY Product_Line
ORDER BY Gross_Income DESC;


-- 3.3 Product line performance
SELECT
    Product_Line,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Gross_Income) AS Gross_Income,
    SUM(Quantity) AS Total_Quantity,
    AVG(Customer_Rating) AS Average_Rating
FROM supermarket_sales
GROUP BY Product_Line
ORDER BY Total_Sales DESC;

-- ============================================================
-- 4. BRANCH & CITY PERFORMANCE
-- ============================================================

-- 4.1 Branch performance
SELECT
    Branch,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Gross_Income) AS Gross_Income
FROM supermarket_sales
GROUP BY Branch
ORDER BY Total_Sales DESC;


-- 4.2 City performance
SELECT
    City,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Gross_Income) AS Gross_Income
FROM supermarket_sales
GROUP BY City
ORDER BY Total_Sales DESC;


-- 4.3 Branch gross margin
SELECT
    Branch,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Gross_Income) AS Gross_Income,
    ROUND(
        SUM(Gross_Income) / SUM(Total_Sales) * 100,
        2
    ) AS Gross_Margin_Percentage
FROM supermarket_sales
GROUP BY Branch
ORDER BY Gross_Margin_Percentage DESC;

-- ============================================================
-- 5. CUSTOMER ANALYSIS
-- ============================================================

-- 5.1 Sales by customer type
SELECT
    Customer_Type,
    SUM(Total_Sales) AS Total_Sales
FROM supermarket_sales
GROUP BY Customer_Type
ORDER BY Total_Sales DESC;


-- 5.2 Average transaction value
SELECT
    Customer_Type,
    AVG(Total_Sales) AS Average_Transaction_Value
FROM supermarket_sales
GROUP BY Customer_Type
ORDER BY Average_Transaction_Value DESC;


-- 5.3 Gender performance
SELECT
    Gender,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales) AS Total_Sales,
    AVG(Total_Sales) AS Average_Transaction_Value
FROM supermarket_sales
GROUP BY Gender
ORDER BY Total_Sales DESC;


-- 5.4 Customer rating by product line
SELECT
    Product_Line,
    AVG(Customer_Rating) AS Average_Rating,
    COUNT(Customer_Rating) AS Number_of_Ratings
FROM supermarket_sales
GROUP BY Product_Line
ORDER BY Average_Rating DESC;

-- ============================================================
-- 6. PAYMENT ANALYSIS
-- ============================================================

-- 6.1 Payment method performance
SELECT
    Payment,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales) AS Total_Sales
FROM supermarket_sales
GROUP BY Payment
ORDER BY Number_of_Transactions DESC;


-- 6.2 Payment method by customer type
SELECT
    Customer_Type,
    Payment,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales) AS Total_Sales
FROM supermarket_sales
GROUP BY Customer_Type, Payment
ORDER BY Customer_Type, Total_Sales DESC;

-- ============================================================
-- 7. MONTHLY SALES ANALYSIS
-- ============================================================

-- 7.1 Monthly sales
SELECT
    MONTH(Date) AS Month,
    SUM(Total_Sales) AS Total_Sales
FROM supermarket_sales
GROUP BY MONTH(Date)
ORDER BY Month;

-- 7.2 Monthly sales and gross income
SELECT
    MONTH(Date) AS Month,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Gross_Income) AS Gross_Income
FROM supermarket_sales
GROUP BY MONTH(Date)
ORDER BY Month;

-- ============================================================
-- 8. CUSTOMER SEGMENTATION
-- ============================================================

-- 8.1 Gender and customer type performance
SELECT
    Gender,
    Customer_Type,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales) AS Total_Sales
FROM supermarket_sales
GROUP BY Gender, Customer_Type
ORDER BY Total_Sales DESC;


-- 8.2 Branch and product line performance
SELECT
    Branch,
    Product_Line,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Gross_Income) AS Gross_Income
FROM supermarket_sales
GROUP BY Branch, Product_Line
ORDER BY Branch, Total_Sales DESC;


-- 8.3 Customer rating by branch
SELECT
    Branch,
    AVG(Customer_Rating) AS Average_Rating,
    COUNT(Customer_Rating) AS Number_of_Ratings
FROM supermarket_sales
GROUP BY Branch
ORDER BY Average_Rating DESC;

-- ============================================================
-- 9. KEY BUSINESS INSIGHTS
-- ============================================================

/*
1. Fashion Accessories generated the highest total sales
   at 447,127.74 and also generated the highest gross income
   at 45,796.24.

2. Fashion Accessories also recorded the highest quantity sold
   with 1,021 units.

3. Electronic Accessories achieved the highest gross margin
   percentage at approximately 10.34%, despite having the
   lowest average customer rating at approximately 6.89.

4. Yangon was the strongest city, generating total sales of
   approximately 874,588.98 and gross income of 88,617.29.

5. Branch A generated the highest total sales and gross income,
   while Branch C achieved the highest gross margin percentage.

6. Normal customers generated higher total sales than Members
   and also had a higher average transaction value.

7. Female customers generated higher total sales and a higher
   average transaction value than Male customers despite having
   slightly fewer transactions.

8. Cash was the most frequently used payment method and also
   generated the highest total sales.

9. January recorded the highest monthly sales during Q1 2019,
   while February recorded the lowest.

10. Health and Beauty had the highest average customer rating,
    while Electronic Accessories had the lowest.

11. Branch C showed lower sales and customer ratings compared
    with the other branches, despite having the highest gross
    margin percentage, indicating a potential opportunity to
    improve sales volume and customer experience.

12. The dataset contains 1,000 transactions, with 8
    missing customer ratings and 5 missing payment values.
*/