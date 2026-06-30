{#
    Axis 4b — Staff performance. Per-salesperson orders, revenue and average order
    value, with their store and active flag.
#}
with staffs as (
    select * from {{ ref('dim_staffs') }}
),

orders as (
    select * from {{ ref('fct_orders') }}
)

select
    st.staff_id,
    st.full_name,
    st.store_name,
    st.is_active,
    count(distinct o.order_id)      as num_orders,
    coalesce(sum(o.num_units), 0)   as units_sold,
    coalesce(sum(o.order_total), 0) as revenue,
    round(coalesce(sum(o.order_total), 0) / nullif(count(distinct o.order_id), 0), 2) as avg_order_value
from staffs st
left join orders o on st.staff_id = o.staff_id
group by 1, 2, 3, 4
order by revenue desc
