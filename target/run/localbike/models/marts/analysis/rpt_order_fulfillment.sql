
  
    

  create  table "neondb"."dbt_localbike"."rpt_order_fulfillment__dbt_tmp"
  
  
    as
  
  (
    
with orders as (
    select * from "neondb"."dbt_localbike"."fct_orders"
)

select
    order_status,
    is_fulfilled,
    count(*)                                                  as num_orders,
    sum(order_total)                                          as revenue,
    sum(case when is_shipped then 1 else 0 end)               as num_shipped,
    round(avg(days_to_ship), 1)                               as avg_days_to_ship,
    sum(case when shipped_on_time then 1 else 0 end)          as num_on_time,
    round(
        100.0 * sum(case when shipped_on_time then 1 else 0 end)
        / nullif(sum(case when is_shipped then 1 else 0 end), 0),
    1) as pct_shipped_on_time
from orders
group by 1, 2
order by 1
  );
  