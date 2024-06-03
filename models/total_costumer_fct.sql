{{ config(materialized='table')}}

with total_customer as (
    select a.user_name, a.user_id, b.avg_rating, COALESCE((c.total_amount),0) as total_amount, c.total_orders from users as a
    left join 
    {{ ref('avg_rating_stg')}} b
    on a.user_id = b.user_id
    left join
    {{ ref('total_order_stg')}} c
    on a.user_id = c.user_id

)

select * from total_customer