{#
    Order header grain. Adds the human-readable status (from the seed), line-level
    rollups (totals / units / line count) and shipping-performance fields used by
    the fulfillment analysis. Date math uses dbt cross-db macros for portability.
#}
with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

status as (
    select * from {{ ref('seed_order_status') }}
),

order_lines as (
    select
        order_id,
        count(*)          as num_line_items,
        sum(quantity)     as num_units,
        sum(net_revenue)  as order_total
    from order_items
    group by 1
)

select
    o.order_id,
    o.customer_id,
    o.store_id,
    o.staff_id,
    o.order_status_code,
    s.status_name        as order_status,
    s.is_fulfilled,
    o.order_date,
    o.required_date,
    o.shipped_date,
    (o.shipped_date is not null) as is_shipped,
    case when o.shipped_date is not null
         then {{ dbt.datediff('o.order_date', 'o.shipped_date', 'day') }}
    end as days_to_ship,
    case when o.shipped_date is not null and o.required_date is not null
         then {{ dbt.datediff('o.required_date', 'o.shipped_date', 'day') }}
    end as ship_delay_vs_required,
    case when o.shipped_date is not null and o.required_date is not null
         then (o.shipped_date <= o.required_date)
    end as shipped_on_time,
    coalesce(ol.num_line_items, 0) as num_line_items,
    coalesce(ol.num_units, 0)      as num_units,
    coalesce(ol.order_total, 0)    as order_total
from orders o
left join order_lines ol on o.order_id = ol.order_id
left join status s on o.order_status_code = s.status_code
