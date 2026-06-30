
    
    

with all_values as (

    select
        stock_level as value_field,
        count(*) as n_records

    from "neondb"."dbt_localbike"."rpt_inventory_status"
    group by stock_level

)

select *
from all_values
where value_field not in (
    'Out of stock','Low','OK'
)


