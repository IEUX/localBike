





with validation_errors as (

    select
        store_id, product_id
    from "neondb"."dbt_localbike"."rpt_inventory_status"
    group by store_id, product_id
    having count(*) > 1

)

select *
from validation_errors


