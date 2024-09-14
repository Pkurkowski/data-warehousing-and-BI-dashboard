# eCommerce Data Warehousing & BI Dashboard

This project demonstrates how to build an end-to-end data warehousing and business intelligence (BI) solution for an eCommerce store. The pipeline pulls raw eCommerce data, loads it into Snowflake for data warehousing, and provides insights into key business metrics such as sales, customer behavior, and product performance through a BI dashboard.

## Project Features:
- Models customer, product, and order data for an eCommerce store.
- Loads raw data into Snowflake and structures it for analytics.
- Visualizes key business metrics such as total sales, top products, and customer behavior using Power BI or Tableau.

## Tech Stack:
- **Snowflake**: For data warehousing and analytical queries.
- **Python**: For data extraction and transformation (ETL).
- **SQL**: For querying data.
- **Power BI/Tableau**: For visualizing sales and customer metrics.

---

## Installation and Setup:

### 1. **Create the Snowflake Database and Schema:**
   - Create a Snowflake account and set up a new database.
   - Run the `create_ecommerce_schema.sql` file to create the tables in Snowflake.
   
### 2. **Load Data into Snowflake:**
   - Use the `load_data_snowflake.py` script to load data into the `customers`, `products`, `orders`, and `order_details` tables in Snowflake.

### 3. **Query Data for Analysis:**
   - Use SQL queries to analyze business metrics such as total sales, top customers, and product performance.
   - Example queries are provided below for common use cases like sales by product and customer behavior.

---

## Building the BI Dashboard

### **Step-by-Step Guide to Building the Dashboard (Power BI or Tableau)**

### 1. **Connect Power BI/Tableau to Snowflake:**

#### For Power BI:
   1. **Download and install Power BI Desktop** if you haven’t already from [here](https://powerbi.microsoft.com/desktop/).
   2. In Power BI, go to **Home > Get Data > More**.
   3. In the list of data sources, search for **Snowflake**, select it, and click **Connect**.
   4. Enter your **Snowflake server URL** and login credentials.
   5. Choose the **database** and **tables** you want to import into Power BI (e.g., `customers`, `products`, `orders`, etc.).
   
#### For Tableau:
   1. **Download and install Tableau Desktop** from [here](https://www.tableau.com/products/desktop).
   2. In Tableau, go to **File > Connect to Data**.
   3. Select **Snowflake** from the list of connectors.
   4. Enter your **Snowflake server URL** and login credentials.
   5. Import the necessary tables into Tableau (e.g., `customers`, `products`, `orders`).

---

### 2. **Create Visualizations:**

#### **Total Sales by Product**:
   - **Chart Type**: Bar Chart
   - **Data Source**: Use the `order_details` table and join it with the `products` table.
   - **X-Axis**: `product_name` from the `products` table.
   - **Y-Axis**: Sum of `(quantity * price_per_unit)` from the `order_details` table.

#### **Top Customers by Spending**:
   - **Chart Type**: Bar Chart or Pie Chart
   - **Data Source**: Use the `orders` table and join it with the `customers` table.
   - **X-Axis**: `customer_name` from the `customers` table.
   - **Y-Axis**: Sum of `total_amount` from the `orders` table.

#### **Monthly Sales Trend**:
   - **Chart Type**: Line Chart
   - **Data Source**: Use the `orders` table.
   - **X-Axis**: `order_date` (grouped by month).
   - **Y-Axis**: Sum of `total_amount`.

#### **Top Categories by Sales**:
   - **Chart Type**: Bar Chart
   - **Data Source**: Join the `order_details` and `products` tables.
   - **X-Axis**: `product_category` from the `products` table.
   - **Y-Axis**: Sum of `(quantity * price_per_unit)` from the `order_details` table.

---

### 3. **Customize the Dashboard**:
   - Add **filters** for dynamic exploration (e.g., filter by customer, product category, or date).
   - Create **interactive visualizations** that allow users to drill down into the data.

### 4. **Publish or Export the Dashboard**:
   - In **Power BI**, you can publish the report to Power BI Service for online access.
   - In **Tableau**, you can publish to Tableau Server or Tableau Public.

---

## Example Queries for Analysis:

- **Total Sales by Product**:
```sql
SELECT p.product_name, SUM(od.quantity * od.price_per_unit) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;
