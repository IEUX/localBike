


with __dbt__cte__int_order_items_enriched as (

with order_items as (
    select * from "neondb"."dbt_localbike"."stg_order_items"
),

orders as (
    select * from "neondb"."dbt_localbike"."stg_orders"
),

products as (
    select * from "neondb"."dbt_localbike"."stg_products"
),

brands as (
    select * from "neondb"."dbt_localbike"."stg_brands"
),

categories as (
    select * from "neondb"."dbt_localbike"."stg_categories"
)

select
    -- line grain
    oi.order_id,
    oi.item_id,
    -- order context
    o.customer_id,
    o.store_id,
    o.staff_id,
    o.order_status_code,
    o.order_date,
    -- product context
    oi.product_id,
    p.product_name,
    p.brand_id,
    b.brand_name,
    p.category_id,
    c.category_name,
    p.model_year,
    -- measures
    oi.quantity,
    oi.list_price,
    oi.discount,
    oi.net_revenue
from order_items oi
inner join orders o on oi.order_id = o.order_id
inner join products p on oi.product_id = p.product_id
left join brands b on p.brand_id = b.brand_id
left join categories c on p.category_id = c.category_id
) select
    md5(cast(coalesce(cast(order_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(item_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as order_item_key,
    order_id,
    item_id,
    order_date,
    order_status_code,
    customer_id,
    store_id,
    staff_id,
    product_id,
    brand_id,
    category_id,
    quantity,
    list_price,
    discount,
    net_revenue
from __dbt__cte__int_order_items_enriched


    -- only process orders newer than what we have already loaded
    where order_date > (select coalesce(max(order_date), cast('1900-01-01' as date)) from "neondb"."dbt_localbike"."fct_order_items")
