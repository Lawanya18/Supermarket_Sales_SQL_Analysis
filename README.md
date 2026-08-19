# Supermarket Sales SQL Analysis

## Project Overview

This project analyzes a supermarket sales dataset using MySQL to identify sales performance, profitability, customer behavior, product performance, payment patterns, and branch-level trends.

The analysis focuses on transforming transactional sales data into meaningful business insights that can support decisions related to product strategy, customer engagement, branch performance, and profitability.

---

## Business Questions

The project answers the following business questions:

- What are the overall sales, quantity sold, and gross income?
- Which product lines generate the highest sales?
- Which product lines generate the highest gross income?
- Which product lines have the highest gross margin?
- Which branch and city perform best in terms of sales?
- How do different customer types contribute to sales?
- What is the average transaction value for different customer types?
- How do male and female customers differ in sales performance?
- Which payment method is used most frequently?
- How do payment preferences differ between customer types?
- Which product lines have the highest customer ratings?
- How do branches differ in customer satisfaction?
- What are the monthly sales trends during Q1 2019?
- How do product lines perform across different branches?
- Which customer segments contribute the most sales?

---

## Dataset

The dataset contains supermarket transaction-level sales information for Q1 2019.

### Dataset Size

- **1,000 transactions**
- **3 branches**
- **3 cities**
- **6 product lines**

### Key Columns

| Column | Description |
|---|---|
| Invoice_ID | Unique transaction identifier |
| Date | Transaction date |
| Branch | Supermarket branch |
| City | City where the branch is located |
| Customer_Type | Member or Normal customer |
| Gender | Customer gender |
| Product_Line | Product category |
| Unit_Price | Price per unit |
| Quantity | Number of units purchased |
| COGS | Cost of goods sold |
| Gross_Income | Gross income generated |
| Tax_5pct | Tax amount |
| Total_Sales | Total transaction value |
| Payment | Payment method |
| Customer_Rating | Customer rating |

---

## Data Quality Checks

Before performing the analysis, the dataset was validated using SQL.

The following checks were performed:

- Total record count
- Duplicate Invoice_ID check
- Date range validation
- Missing customer ratings
- Missing payment values

### Data Quality Results

| Check | Result |
|---|---:|
| Total Transactions | 1,000 |
| Duplicate Invoice IDs | 0 |
| Missing Customer Ratings | 8 |
| Missing Payment Values | 5 |
| First Transaction | 2019-01-01 |
| Last Transaction | 2019-03-30 |

The missing values were retained rather than artificially replaced because they represent genuine missing information in the source dataset.

---

## SQL Analysis

The analysis was organized into the following sections:

### 1. Data Quality Checks
Validated transaction counts, duplicates, date range, and missing values.

### 2. Overall Business Performance
Calculated total sales, total quantity sold, and total gross income.

### 3. Product Performance
Analyzed sales, quantity, gross income, gross margin, and customer ratings across product lines.

### 4. Branch & City Performance
Compared branches and cities based on transactions, sales, gross income, and gross margin.

### 5. Customer Analysis
Analyzed customer types, gender, average transaction value, and customer ratings.

### 6. Payment Analysis
Analyzed payment method usage and sales contribution.

### 7. Monthly Sales Analysis
Analyzed monthly sales performance across Q1 2019.

### 8. Customer Segmentation
Analyzed combinations of gender, customer type, branch, product line, and payment method.

### 9. Key Business Insights
Summarized the main findings and business recommendations from the analysis.

---

## Key Business Insights

### Product Performance

- **Fashion Accessories** generated the highest total sales at **447,127.74**.
- Fashion Accessories also generated the highest gross income at **45,796.24**.
- Fashion Accessories recorded the highest quantity sold with **1,021 units**.
- **Electronic Accessories** had the highest gross margin percentage at approximately **10.34%**.
- **Health and Beauty** had the highest average customer rating at approximately **7.09**.
- **Electronic Accessories** had the lowest average customer rating at approximately **6.89%**.

### Branch & City Performance

- **Yangon** generated the highest total sales at approximately **874,588.98**.
- Yangon also recorded the highest number of transactions and gross income.
- **Branch A** generated the highest total sales and gross income.
- **Branch C** achieved the highest gross margin percentage at approximately **10.24%**.
- Branch C had the lowest average customer rating among the three branches.

### Customer Performance

- **Normal customers** generated higher total sales than Members.
- Normal customers also had a higher average transaction value.
- Female customers generated higher total sales despite having slightly fewer transactions than male customers.
- Female customers also had a higher average transaction value.

### Payment Behavior

- **Cash** was the most frequently used payment method.
- Cash also generated the highest total sales.
- Cash was the leading payment method for both Members and Normal customers.
- **5 transactions** had missing payment information.

### Monthly Performance

- **January 2019** recorded the highest sales during Q1 2019.
- **February 2019** recorded the lowest sales during Q1 2019.

---

## Business Recommendations

Based on the analysis, the following recommendations can be considered:

1. **Focus on Fashion Accessories**
   - Fashion Accessories is the strongest product line by sales, gross income, and quantity.
   - Inventory and promotional strategies can prioritize this category while maintaining adequate stock levels.

2. **Investigate Electronic Accessories**
   - Electronic Accessories has the highest gross margin but the lowest customer rating.
   - Management could investigate product quality, pricing, customer expectations, and service experience.

3. **Improve Branch C Performance**
   - Branch C has the lowest sales and customer rating despite having the highest gross margin percentage.
   - The branch could benefit from strategies focused on increasing customer traffic, improving customer experience, and increasing sales volume.

4. **Leverage Customer Segmentation**
   - Normal customers currently contribute more sales than Members.
   - Targeted campaigns could be used to increase Member spending and improve customer retention.

5. **Monitor Monthly Sales Patterns**
   - February showed weaker sales compared with January and March.
   - Promotional campaigns and targeted offers could be considered during weaker sales periods.

6. **Continue Monitoring Customer Feedback**
   - Product and branch-level ratings should be monitored alongside sales and profitability.
   - High sales should not be evaluated independently from customer satisfaction.

---

## SQL Skills Demonstrated

This project demonstrates practical use of:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- Aggregate functions
  - `SUM()`
  - `AVG()`
  - `COUNT()`
  - `MIN()`
  - `MAX()`
- Date functions
- `ROUND()`
- `CASE`
- `DISTINCT`
- Grouping across multiple dimensions
- Data quality validation
- Business-oriented SQL analysis
- Customer segmentation
- Profitability analysis

---

## Project Workflow

```text
Raw Dataset
     ↓
Data Quality Checks
     ↓
MySQL Database
     ↓
Data Import & Validation
     ↓
SQL Business Analysis
     ↓
Customer & Product Segmentation
     ↓
Business Insights
     ↓
Recommendations
