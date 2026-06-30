
  
    

  create  table "neondb"."dbt_localbike"."rpt_inventory_status__dbt_tmp"
  
  
    as
  
  (
    
with stocks as (
    select * from "neondb"."dbt_localbike"."stg_stocks"
),

products as (
    select * from "neondb"."dbt_localbike"."dim_products"
),

stores as (
    select * from "neondb"."dbt_localbike"."dim_stores"
),

sales as (
    select
        store_id,
        product_id,
        sum(quantity) as units_sold
    from "neondb"."dbt_localbike"."fct_order_items"
    group by 1, 2
)

select
    s.store_id,
    st.store_name,
    s.product_id,
    p.product_name,
    p.category_name,
    s.quantity                       as units_on_hand,
    coalesce(sl.units_sold, 0)       as units_sold_all_time,
    case
        when s.quantity = 0 then 'Out of stock'
        when s.quantity < 10 then 'Low'
        else 'OK'
    end as stock_level,
    (coalesce(sl.units_sold, 0) = 0) as never_sold
from stocks s
inner join stores st on s.store_id = st.store_id
inner join products p on s.product_id = p.product_id
left join sales sl on s.store_id = sl.store_id and s.product_id = sl.product_id
  );
  