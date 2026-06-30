
    
    



select order_status_code
from "neondb"."dbt_localbike"."stg_orders"
where order_status_code is null


