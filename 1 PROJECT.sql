CREATE TABLE customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT references customers(customer_id),
    Book_ID INT references books(book_id),
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10, 2)
);


CREATE TABLE books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(100),
    Price DECIMAL(10, 2),
    Published_Year INT
);

select * from customers;
select * from books;
select * from orders;

-- Select all books where genre was Fiction

1. select * from books 
where genre = 'Fiction';

-- Select all books which was published after 1950

2. select title, genre, published
from books
where published>1950
order by published asc;

-- Select all details where country was canada

3. select email, country, name
from customers
where country= 'Canada';

-- Select details of all book which was published in november 2023

4. select * from orders 
where order_date between '2023-11-01' and '2023-11-30';

-- Answer total number of books available

5. select sum(stock) as total_stock
from books;

-- Retreive the most expensive book

6. select title, author, genre, price
from books
order by price desc 
limit 1;

-- Select all who orders more then 1 order

7. select * from orders
where quantity > 1;

-- Select all orders where customer spent at least 20Rs

8. select * from orders
where total_amount > 20
order by total_amount desc;

-- Select all the genre of books
available 
9. select distinct genre 
from books;

-- Select top 10 available books in the stock

10. select title, author, genre, stock, book_id
from books
order by stock asc
limit 10;

-- calculate total revenue from all the books sold 

11.select sum(total_amount) total_revenue
from orders;

--Advance questions SQL

select * from customers;
select * from books;
select * from orders;

-- Retrieve the total number of books of each genre

1. select b. genre, sum(o. quantity) as total_orders
from books b
join orders o
on o.book_id = b.book_id
group by b.genre;

-- Find the average price of books in the 'Fantasy' genre

2.select avg(price) as average_price
from  books
where genre= 'Fantasy';

-- List customers who have placed at least 2 orders

3. select o.customer_id, c.name, count(o.order_id) as order_count
from customers c
join orders o
on c. customer_id = o. customer_id
group by o.customer_id, c.name
having count (order_id)>=2
order by order_count asc;


select o.customer_id, c.name, count(o.order_id) as order_count
from customers c
join orders o
on c.customer_id = o. customer_id
group by o.customer_id, c.name
having count (o.order_id) >=2
order by order_count desc;

-- Find the most frequently orderd books

4. select o.book_id, b. title, count(o.order_id) as total_order
from orders o
join books b
on o.book_id = b. book_id
group by o.book_id, b.title
order by total_order desc
limit 10;

-- Show the top 3 most expensive booksof 'Fantasy' genre

5. select title, price, genre
from books
where genre = 'Fantasy'
order by price desc
limit 3;

-- Retrieve the total quantity of books sold by each author

6. select b.author, b.title, sum(o.quantity)as total_quantity
from orders o
join books b 
on b. book_id = o. book_id
group by b.author, b.title
order by total_quantity desc;

-- List the cities where customers who spent over 30Rs

7. select c.city, c.name, sum(o.total_amount) as total_spent
from orders o
join customers c
on o.customer_id = c.customer_id
group by c.city, c.name, total_amount
having sum (o.total_amount) >= 30
order by total_spent desc
limit 5;

-- Find the customers who spent the most on orders

8. select c.name, o.customer_id, sum (o.total_amount) as total_spent
from orders o
join customers c
on c.customer_id = o. customer_id
group by c.name, o.customer_id
order by total_spent desc
limit 1;

-- Calculate the stock remaining after fulfilling all orders

9. select b.book_id, b. title, b.stock, 
coalesce (sum(o.quantity),0) as order_quantity,
b.stock-coalesce (sum(o.quantity),0) as remaining_quantity
from books b
left join orders o
on b. book_id = o.book_id
group by b.book_id
order by b.book_id;



































