{{ config(materialized='view')}}

with avg_rating as (select user_id, avg(rating) as avg_rating from customer_reviews 
group by user_id)

select * from avg_rating