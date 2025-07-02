# Task-09-Sales-Trend-Analysis

# Task 09 – Sales Trend Analysis Using Aggregations (SQL)

## 📌 Objective
To analyze monthly revenue and order trends using SQL aggregation techniques, identify peak sales months, and understand customer buying patterns over time.

---

## 🧰 Tools Used
- MySQL Workbench
- SQL
- Dataset: `online_sales_dataset` (manually created)

---

## 📊 Dataset Fields
| Column Name | Description          |
|-------------|----------------------|
| order_id    | Unique order ID      |
| order_date  | Date of the order    |
| amount      | Revenue from order   |
| product_id  | ID of purchased item |

---

## 🧾 Queries Performed

### 1. Monthly Revenue & Order Volume
```sql
SELECT 
  YEAR(order_date) AS order_year,
  MONTH(order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM 
  online_sales_dataset
GROUP BY 
  order_year, order_month
ORDER BY 
  order_year, order_month;
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month_year,
  SUM(amount) AS total_revenue
FROM 
  online_sales_dataset
GROUP BY 
  month_year
ORDER BY 
  total_revenue DESC
LIMIT 5;
SELECT 
  DATE_FORMAT(order_date, '%b %Y') AS month_year,
  SUM(amount) AS revenue,
  COUNT(DISTINCT order_id) AS orders
FROM 
  online_sales_dataset
WHERE 
  YEAR(order_date) = 2023
GROUP BY 
  month_year
ORDER BY 
  STR_TO_DATE(month_year, '%b %Y');
