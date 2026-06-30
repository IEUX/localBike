{#
    SCD2 snapshot of order lifecycle. Captures a new version of an order row whenever
    its status code or shipped date changes, so the team can analyse how orders move
    through the pipeline over time. Uses the `check` strategy (no reliable updated_at
    in the source).
#}
{% snapshot orders_status_snapshot %}

{{ config(
    unique_key='order_id',
    strategy='check',
    check_cols=['order_status_code', 'shipped_date']
) }}

select
    order_id,
    order_status_code,
    shipped_date,
    store_id,
    staff_id,
    order_date
from {{ ref('stg_orders') }}

{% endsnapshot %}
