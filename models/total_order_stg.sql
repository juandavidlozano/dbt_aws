{{ config(materialized='view')}}

with total_orders as (select user_id, sum(total_amount) as total_amount, count(order_id) as total_orders from orders
group by user_id
order by total_orders desc)

select * from total_orders