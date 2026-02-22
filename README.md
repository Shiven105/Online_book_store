# 📚 Online Bookstore Database Management System (SQL Project)

## 📌 Project Objective

The objective of this project is to design and analyze a relational database system for an **Online Bookstore** using PostgreSQL.

This project demonstrates:

* Database creation and schema design
* Establishing relationships using Primary & Foreign Keys
* Writing structured SQL queries
* Performing inventory analysis
* Generating revenue and sales insights
* Using aggregation, joins, filtering, and grouping

The goal is to simulate real-world business data analysis using SQL.

---

# 🗄 Database Design

## 📍 Step 1: Create Database

```sql
CREATE DATABASE onlinebooks;
```

---

# 🧱 Table Structure

## 1️⃣ Books Table

```sql
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    publishes_year INT,
    price NUMERIC(10,2),
    stock INT
);
```

**Purpose:**
Stores book inventory details including genre, pricing, and stock levels.

---

## 2️⃣ Customers Table

```sql
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(150)
);
```

**Purpose:**
Stores customer information for order tracking and regional analysis.

---

## 3️⃣ Orders Table

```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    book_id INT REFERENCES books(book_id),
    order_date DATE,
    quantity INT,
    total_amount NUMERIC(10,2)
);
```

**Purpose:**
Stores transactional data and links Customers and Books tables.

---

# 🔗 Database Relationships

* One Customer → Many Orders
* One Book → Many Orders
* Orders acts as a bridge table

Foreign Keys:

* `orders.customer_id` → `customers.customer_id`
* `orders.book_id` → `books.book_id`

---

# 📊 SQL Queries & Analysis

---

## 1. Retrieve all books from Fiction genre

```sql
SELECT *
FROM books
WHERE genre = 'Fiction';
```

---

## 2. Find books published after 1950

```sql
SELECT *
FROM books
WHERE publishes_year >= 1950;
```

---

## 3. List all customers from Canada

```sql
SELECT *
FROM customers
WHERE country = 'Canada';
```

---

## 4. Show orders placed in November 2023

```sql
SELECT *
FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';
```

---

## 5. Retrieve total stock of books available

```sql
SELECT SUM(stock) AS total_stock
FROM books;
```

---

## 6. Find details of the most expensive book

```sql
SELECT *
FROM books
ORDER BY price DESC
LIMIT 1;
```

---

## 7. Show orders where quantity is greater than 1

```sql
SELECT *
FROM orders
WHERE quantity > 1;
```

---

## 8. Retrieve orders where total amount exceeds $20

```sql
SELECT *
FROM orders
WHERE total_amount > 20;
```

---

## 9. List all available genres

```sql
SELECT DISTINCT genre
FROM books;
```

---

## 10. Find the book with the lowest stock

```sql
SELECT *
FROM books
ORDER BY stock
LIMIT 1;
```

---

## 11. Calculate total revenue generated

```sql
SELECT SUM(total_amount) AS revenue_generated
FROM orders;
```

---

## 12. Retrieve total number of books sold for each genre

```sql
SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;
```

---

## 13. Find average price of Fantasy books

```sql
SELECT AVG(price) AS avg_price
FROM books
WHERE genre = 'Fantasy';
```

---

## 14. List customers who placed at least 2 orders

```sql
SELECT o.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(order_id) >= 2;
```

---

## 15. Find the most frequently ordered book

```sql
SELECT o.book_id, b.title, COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY order_count DESC
LIMIT 1;
```

---

## 16. Show top 3 most expensive Fantasy books

```sql
SELECT *
FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;
```

---

## 17. Retrieve total quantity of books sold by each author

```sql
SELECT b.author, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.author;
```

---

# 🧠 SQL Concepts Demonstrated

* Data Definition Language (DDL)
* Relational schema design
* Primary & Foreign Key constraints
* Data filtering (WHERE, BETWEEN)
* Sorting & limiting results
* Aggregate functions (SUM, AVG, COUNT)
* GROUP BY and HAVING
* INNER JOIN operations
* Business-driven query analysis

---

# 📈 Business Insights Derived

* Total inventory tracking for stock management
* Identification of high-demand books
* Revenue calculation for sales performance
* Genre-wise sales comparison
* Author performance tracking
* Customer activity analysis
* Identification of low-stock products for restocking

---

# 📁 Project Structure

```
online-bookstore-sql/
│── online_books_sql.sql
│── Books.csv
│── Customers.csv
│── Orders.csv
│── README.md
```

---

# 🎯 Conclusion

This project demonstrates strong foundational skills in:

* Relational database design
* Writing optimized SQL queries
* Business data analysis
* Practical use of joins and aggregation
* Translating business questions into SQL logic

Author - Shiven Chauhan
This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. Email id : shivenchauhan105@gmail.com

Linkedin : https://www.linkedin.com/in/shiven-chauhan-777650351?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app

Thank you for your support, and I look forward to connecting with you!


