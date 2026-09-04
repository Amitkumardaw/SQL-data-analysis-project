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

1. select * from books 
where genre = 'Fiction';

2. select title, genre, published
from books
where published>1950
order by published asc;

3. select email, country, name
from customers
where country= 'Canada';

4. select * from orders 
where order_date between '2023-11-01' and '2023-11-30';

5. select sum(stock) as total_stock
from books;

select * from customers;
select * from books;
select * from orders;

6. select title, author, genre, price
from books
order by price desc 
limit 1;

7. select * from orders
where quantity > 1;

8. select * from orders
where total_amount > 20
order by total_amount desc;

9. select distinct genre 
from books;

10. select title, author, genre, stock, book_id
from books
order by stock asc
limit 10;

11.select sum(total_amount) total_revenue
from orders;

--Advance questions SQL

select * from customers;
select * from books;
select * from orders;

1. select b. genre, sum(o. quantity) as total_orders
from books b
join orders o
on o.book_id = b.book_id
group by b.genre;

2.select avg(price) as average_price
from  books
where genre= 'Fantasy';

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

4. select o.book_id, b. title, count(o.order_id) as total_order
from orders o
join books b
on o.book_id = b. book_id
group by o.book_id, b.title
order by total_order desc
limit 10;

5. select title, price, genre
from books
where genre = 'Fantasy'
order by price desc
limit 3;

select * from customers;
select * from books;
select * from orders;


6. select b.author, b.title, sum(o.quantity)as total_quantity
from orders o
join books b 
on b. book_id = o. book_id
group by b.author, b.title
order by total_quantity desc;

7. select c.city, c.name, sum(o.total_amount) as total_spent
from orders o
join customers c
on o.customer_id = c.customer_id
group by c.city, c.name, total_amount
having sum (o.total_amount) >= 30
order by total_spent desc
limit 5;

select * from customers;
select * from books;
select * from orders;

9. select c.name, o.customer_id, sum (o.total_amount) as total_spent
from orders o
join customers c
on c.customer_id = o. customer_id
group by c.name, o.customer_id
order by total_spent desc
limit 1;

9. select b.book_id, b. title, b.stock, 
coalesce (sum(o.quantity),0) as order_quantity,
b.stock-coalesce (sum(o.quantity),0) as remaining_quantity
from books b
left join orders o
on b. book_id = o.book_id
group by b.book_id
order by b.book_id;



































