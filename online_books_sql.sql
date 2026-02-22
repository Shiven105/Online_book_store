DROP DATABASE Netflix_1

-- CREATE DATABASE
CREATE DATABASE onlinebooks;

CREATE TABLE books  ( 
                      book_id SERIAL PRIMARY KEY,
					  TITLE VARCHAR(100),
					  Author VARCHAR(100),
					  Genre VARCHAR(50),
					  Publishes_year INT,
					  price NUMERIC(10,2),
					  stock INT
					  );

CREATE TABLE customers ( 
                         customer_id SERIAL PRIMARY KEY,
						 name VARCHAR(100),
						 email VARCHAR(100),
						 phone VARCHAR(100),
						 city VARCHAR(50),
						 country VARCHAR(150)
                        );


CREATE TABLE orders ( order_id SERIAL PRIMARY KEY,
                      customer_id INT REFERENCES customers(customer_id),
					  book_id INT REFERENCES books(book_id),
					  order_date DATE,
					  quantity INT,
					  total_amount NUMERIC(10,2)
					  );


SELECT* FROM books
SELECT * FROM customers
SELECT * FROM orders


-- Retrieve all the books from FICTION genre
SELECT *
FROM books
WHERE genre = 'Fiction';

-- Find books publishes after year 1950
SELECT *
FROM books
WHERE publishes_year >= 1950;

-- List all the customers from Canada
SELECT * 
FROM customers
WHERE country = 'Canada';

-- Show orders placed in november 2023
SELECT *
FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- Retrieve total stock of books available
SELECT SUM(stock) AS total_stock
FROM books;

-- Find the details of most expensive book
SELECT *
FROM books
ORDER BY price DESC
LIMIT 1;

-- Show all customers who ordered more than 1 quantity of book
SELECT *
FROM orders
WHERE quantity > 1;

-- Retrieve all orders where total amount exceeds $20
SELECT *
FROM orders
WHERE total_amount > 20;

-- List all genres available in the books table
SELECT DISTINCT genre
FROM books
GROUP BY genre;

-- Find the book with the lowest stock
SELECT *
FROM books
ORDER BY stock 
limit 1;

-- Calculate the total revenue generated from all orders
SELECT SUM(total_amount) AS revenue_generated
FROM orders;

-- Retrieve total number of books sold for each genre
SELECT b.genre , SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;

-- FInd avg price of books in the fantasy genre
SELECT AVG(price) AS avg_price
FROM books
WHERE genre = 'Fantasy';

-- List customers who have placed atleast 2 orders
SELECT o.customer_id , c.name , COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id , c.name
HAVING COUNT(order_id) >= 2;

-- Find the most frequently ordered book
SELECT o.book_id , b.title , COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY o.book_id , b.title
ORDER BY order_count DESC 
LIMIT 1;

-- Show the top 3 most expensive books of fantasy genre
SELECT *
FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- Retreive the total quantity of books sold by each author
SELECT b.author ,  SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.author;