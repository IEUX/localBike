
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select num_orders
from "neondb"."dbt_localbike"."rpt_order_fulfillment"
where num_orders is null



  
  
      
    ) dbt_internal_test