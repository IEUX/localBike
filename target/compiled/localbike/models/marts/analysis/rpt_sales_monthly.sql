
with order_items as (
    select * from "neondb"."dbt_localbike"."fct_order_items"
)

select
    cast(date_trunc('month', order_date) as date)    as order_month,
    cast(extract(year from order_date) as integer)  as year,
    count(distinct order_id)                                     as num_orders,
    sum(quantity)                                                as units_sold,
    sum(net_revenue)                                             as revenue,
    round(sum(net_revenue) / nullif(count(distinct order_id), 0), 2) as avg_order_value
from order_items
group by 1, 2
order by 1