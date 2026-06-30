{#
    Axis 4a — Store performance. Per-store orders, distinct customers, units and
    revenue across the three locations.
#}
with stores as (
    select * from {{ ref('dim_stores') }}
),

orders as (
    select * from {{ ref('fct_orders') }}
)

select
    s.store_id,
    s.store_name,
    s.city,
    s.state,
    count(distinct o.order_id)     as num_orders,
    count(distinct o.customer_id)  as num_customers,
    coalesce(sum(o.num_units), 0)  as units_sold,
    coalesce(sum(o.order_total), 0) as revenue
from stores s
left join orders o on s.store_id = o.store_id
group by 1, 2, 3, 4
order by revenue desc
