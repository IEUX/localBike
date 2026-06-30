{#
    Axis 3 — Customer value. Per-customer order count, lifetime revenue, average
    order value, first/last order dates and a repeat-customer flag. Customers with
    no orders appear with zeroed measures.
#}
with orders as (
    select * from {{ ref('fct_orders') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
),

agg as (
    select
        customer_id,
        count(distinct order_id) as num_orders,
        sum(num_units)           as units,
        sum(order_total)         as total_revenue,
        min(order_date)          as first_order_date,
        max(order_date)          as last_order_date
    from orders
    group by 1
)

select
    c.customer_id,
    c.full_name,
    c.city,
    c.state,
    coalesce(a.num_orders, 0)    as num_orders,
    coalesce(a.units, 0)         as units,
    coalesce(a.total_revenue, 0) as total_revenue,
    round(coalesce(a.total_revenue, 0) / nullif(a.num_orders, 0), 2) as avg_order_value,
    a.first_order_date,
    a.last_order_date,
    (coalesce(a.num_orders, 0) > 1) as is_repeat_customer
from customers c
left join agg a on c.customer_id = a.customer_id
