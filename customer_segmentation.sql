-- create database
create database if not exists customer_segmentation;
use customer_segmentation;

-- create customers table
create table if not exists customers (
    customer_id int primary key,
    customer_name varchar(100),
    city varchar(50),
    signup_date date
);

-- create orders table
create table if not exists orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    amount decimal(10,2),
    foreign key (customer_id) references customers(customer_id)
);

-- insert customer data
insert into customers values
(1, 'aman sharma', 'bangalore', '2023-01-10'),
(2, 'riya patel', 'mumbai', '2023-02-15'),
(3, 'karan mehta', 'delhi', '2023-03-20'),
(4, 'sneha reddy', 'hyderabad', '2023-01-25'),
(5, 'rahul verma', 'pune', '2023-04-05'),
(6, 'pooja singh', 'chennai', '2023-02-18'),
(7, 'vikram joshi', 'ahmedabad', '2023-05-12'),
(8, 'neha kapoor', 'kolkata', '2023-03-30'),
(9, 'arjun nair', 'kochi', '2023-06-01'),
(10, 'meera iyer', 'bangalore', '2023-02-28');

-- insert orders data
insert into orders values
(101, 1, '2023-06-10', 2500),
(102, 2, '2023-06-11', 4000),
(103, 1, '2023-06-15', 1500),
(104, 3, '2023-06-18', 7000),
(105, 4, '2023-06-20', 3000),
(106, 5, '2023-06-25', 2000),
(107, 2, '2023-07-01', 3500),
(108, 6, '2023-07-05', 5000),
(109, 7, '2023-07-10', 12000),
(110, 8, '2023-07-12', 2200),
(111, 9, '2023-07-15', 8000),
(112, 10, '2023-07-18', 600),
(113, 3, '2023-07-20', 2000),
(114, 4, '2023-07-22', 4500),
(115, 5, '2023-07-25', 1800);

-- customer segmentation based on total spend
with customer_data as (
    select 
        c.customer_id,
        c.customer_name,
        count(o.order_id) as order_count,
        coalesce(sum(o.amount),0) as total_spend,
        ntile(3) over (order by coalesce(sum(o.amount),0)) as bucket
    from customers c
    left join orders o
    on c.customer_id = o.customer_id
    group by c.customer_id, c.customer_name
)

select 
    customer_id,
    customer_name,
    order_count,
    total_spend,
    case 
        when bucket = 3 then 'gold'
        when bucket = 2 then 'silver'
        else 'bronze'
    end as customer_tier
from customer_data
order by total_spend desc;


-- summary of each segment
with summary_data as (
    select 
        c.customer_id,
        count(o.order_id) as order_count,
        coalesce(sum(o.amount),0) as total_spend,
        ntile(3) over (order by coalesce(sum(o.amount),0)) as bucket
    from customers c
    left join orders o
    on c.customer_id = o.customer_id
    group by c.customer_id
)

select 
    case 
        when bucket = 3 then 'gold'
        when bucket = 2 then 'silver'
        else 'bronze'
    end as customer_tier,
    count(*) as num_customers,
    round(avg(total_spend),2) as avg_spend,
    round(avg(order_count),2) as avg_orders
from summary_data
group by bucket
order by avg_spend desc;


