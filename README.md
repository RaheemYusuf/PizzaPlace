# 🍕 PizzaPalace SQL Portfolio Project

## About the Project

This project demonstrates my SQL skills by analysing sales and order data for a hypothetical pizza restaurant called **PizzaPalace**. The dataset consists of four related tables that simulate a real-world transactional database used by restaurants to manage products, customer orders, and sales.

The database contains the following tables:

* **pizza_types** – Stores information about each pizza type, including `pizza_type_id`, `name`, `category`, and `ingredients`.
* **pizzas** – Contains details of each pizza variation, including `pizza_id`, `pizza_type_id`, `size`, and `price`.
* **orders** – Records customer orders with `order_id`, `date`, and `time`.
* **order_details** – Stores the individual items within each order, including `order_details_id`, `order_id`, `pizza_id`, and `quantity`.

Using SQL, I explored the dataset to uncover valuable business insights related to sales performance, customer purchasing behaviour, product popularity, and revenue generation.

---

## Project Objective

The objective of this project is to apply SQL to solve real-world business problems using a relational database. Through data exploration and analysis, the project aims to answer key business questions that can support strategic decision-making for PizzaPalace.

The analysis addresses the following business questions:

1. What is the total number of orders received?
2. How much total revenue was generated?
3. Which pizza types are the highest and lowest priced, and how much do they cost?
4. What are the top five most ordered pizza types by quantity?
5. How are pizza orders distributed throughout the hours of the day?
6. What is the average number of pizzas ordered per day?
7. What percentage of total revenue is contributed by each pizza category?
8. What are the top three pizza types by revenue within each pizza category?

These analyses provide insights into customer demand, pricing strategies, product performance, and peak business hours.

---

## SQL Concepts Used

This project demonstrates the practical application of a wide range of SQL concepts commonly used in data analysis and business intelligence.

* **SELECT Statements** – Retrieved and filtered data from multiple tables.
* **INNER JOINs** – Combined related tables to create meaningful datasets for analysis.
* **Aggregate Functions** – Used `SUM()`, `COUNT()`, and `AVG()` to calculate revenue, order volumes, and averages.
* **GROUP BY** – Grouped records to generate category-level and product-level summaries.
* **ORDER BY** – Sorted results to identify top-performing and lowest-performing products.
* **LIMIT / TOP** – Retrieved the highest and lowest ranked records.
* **Subqueries** – Performed multi-step calculations and comparisons.
* **Common Table Expressions (CTEs)** – Improved query readability and simplified complex calculations.
* **Window Functions & Ranking** – Ranked pizza types within each category to identify the top revenue-generating products.
* **Date and Time Functions** – Analysed order trends by date and hour to identify peak ordering periods.

Through this project, I strengthened my ability to write efficient SQL queries, analyse relational data, and transform raw transactional data into actionable business insights.

