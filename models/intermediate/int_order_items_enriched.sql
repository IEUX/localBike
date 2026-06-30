{#
    The central enriched line-item table (grain = order line). Joins each order
    line to its order context (date, store, staff, customer, status) and its
    product context (brand, category). Most analysis marts build on this.
#}
with order_items as (
    select * from {{ ref('stg_order_items') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

brands as (
    select * from {{ ref('stg_brands') }}
),

categories as (
    select * from {{ ref('stg_categories') }}
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
