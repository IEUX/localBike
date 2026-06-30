



select
    order_id,
    order_status_code,
    shipped_date,
    store_id,
    staff_id,
    order_date
from "neondb"."dbt_localbike"."stg_orders"
