
    
    

select
    order_status as unique_field,
    count(*) as n_records

from "neondb"."dbt_localbike"."rpt_order_fulfillment"
where order_status is not null
group by order_status
having count(*) > 1


