{#
    Axis 2 — Product performance. Per-product units, revenue, order count, average
    discount and a revenue rank. Carries brand/category so the BI tool can roll up.
    Products that never sold appear with zeroed measures.
#}
with lines as (
    select * from {{ ref('fct_order_items') }}
),

products as (
    select * from {{ ref('dim_products') }}
),

agg as (
    select
        product_id,
        count(distinct order_id) as num_orders,
        sum(quantity)            as units_sold,
        sum(net_revenue)         as revenue,
        round(avg(discount), 4)  as avg_discount
    from lines
    group by 1
)

select
    p.product_id,
    p.product_name,
    p.brand_name,
    p.category_name,
    p.list_price,
    coalesce(a.num_orders, 0)  as num_orders,
    coalesce(a.units_sold, 0)  as units_sold,
    coalesce(a.revenue, 0)     as revenue,
    a.avg_discount,
    row_number() over (order by coalesce(a.revenue, 0) desc) as revenue_rank
from products p
left join agg a on p.product_id = a.product_id
