-- An order can never ship before it was placed. Any row returned is a data-quality
-- violation where shipped_date precedes order_date.
select
    order_id,
    order_date,
    shipped_date
from "neondb"."dbt_localbike"."fct_orders"
where shipped_date is not null
  and shipped_date < order_date