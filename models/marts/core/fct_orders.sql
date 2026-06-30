{#
    Order fact at order-header grain. One row per order with status, line
    rollups (total / units / line count) and shipping-performance measures.
#}
select
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status_code,
    order_status,
    is_fulfilled,
    order_date,
    required_date,
    shipped_date,
    is_shipped,
    days_to_ship,
    ship_delay_vs_required,
    shipped_on_time,
    num_line_items,
    num_units,
    order_total
from {{ ref('int_orders_enriched') }}
