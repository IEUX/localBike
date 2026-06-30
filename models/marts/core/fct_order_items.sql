{#
    Revenue fact at order-line grain. One row per (order, line item) with a
    surrogate key and the foreign keys to every conformed dimension.

    Materialised incrementally: on a normal run only orders dated after the latest
    already-loaded order are processed, keyed on the surrogate key for upserts.
#}
{{ config(
    materialized='incremental',
    unique_key='order_item_key'
) }}

select
    {{ dbt_utils.generate_surrogate_key(['order_id', 'item_id']) }} as order_item_key,
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
from {{ ref('int_order_items_enriched') }}

{% if is_incremental() %}
    -- only process orders newer than what we have already loaded
    where order_date > (select coalesce(max(order_date), cast('1900-01-01' as date)) from {{ this }})
{% endif %}
