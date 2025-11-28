-- models/mart_sales.sql
with sales as (
    select *
    from {{ ref('stg_sales') }}
)

select
    s.customer_key,
    sum(s.total_amount) as total_spent,
    sum(s.quantity) as total_items
from sales s left join mart_sales a
 on s.total_items=a.mart_sales 
 where a.mart_sales>1000 and s.total_spent >2000 
group by s.customer_key
 
 