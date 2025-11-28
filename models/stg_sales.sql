-- models/stg_sales.sql
with source as (
    select *
    from public.fact_sales
)

select
    sum(sales_key) /1000 as div,
    date_key,
    customer_key,
    product_key,
    quantity,
    total_amount
from source
group by 
 date_key,
    customer_key,
    product_key,
    quantity,
    total_amount