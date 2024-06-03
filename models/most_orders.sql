{{ config(materialized='view')}}

with most_orders as (select COALESCE((b.user_id),0) as user_id, a.user_name, count(b.order_id) as total_orders from users as a 
left join orders as b
on a.user_id = b.user_id
group by b.user_id, a.user_name
order by total_orders desc)

select * from most_orders