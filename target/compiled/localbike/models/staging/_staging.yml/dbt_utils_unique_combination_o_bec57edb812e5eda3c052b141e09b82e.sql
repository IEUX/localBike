





with validation_errors as (

    select
        order_id, item_id
    from "neondb"."dbt_localbike"."stg_order_items"
    group by order_id, item_id
    having count(*) > 1

)

select *
from validation_errors


