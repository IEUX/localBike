
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- The order header total must equal the sum of its line items' net revenue.
-- Any row returned is an order whose fct_orders.order_total disagrees with
-- the rolled-up fct_order_items net revenue (tolerance: 1 cent for rounding).
with line_totals as (
    select
        order_id,
        round(sum(net_revenue), 2) as line_total
    from "neondb"."dbt_localbike"."fct_order_items"
    group by 1
),

order_totals as (
    select order_id, order_total
    from "neondb"."dbt_localbike"."fct_orders"
)

select
    o.order_id,
    o.order_total,
    l.line_total
from order_totals o
inner join line_totals l on o.order_id = l.order_id
where abs(o.order_total - l.line_total) > 0.01
  
  
      
    ) dbt_internal_test