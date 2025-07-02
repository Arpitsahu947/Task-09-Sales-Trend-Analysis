USE superstore_db;


-- Insert some dummy data
INSERT INTO online_sales_dataset VALUES 
(1, '2023-01-15', 150.00, 101),
(2, '2023-01-20', 200.00, 102),
(3, '2023-02-05', 300.00, 101),
(4, '2023-03-10', 250.00, 103),
(5, '2023-03-12', 300.00, 104),
(6, '2023-03-18', 150.00, 101),
(7, '2023-04-01', 400.00, 102);
SELECT * FROM online_sales_dataset;
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
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(amount) AS revenue
FROM 
  online_sales_dataset
GROUP BY 
  month
ORDER BY 
  month;
