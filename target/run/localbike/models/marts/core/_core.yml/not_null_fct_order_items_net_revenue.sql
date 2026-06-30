
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select net_revenue
from "neondb"."dbt_localbike"."fct_order_items"
where net_revenue is null



  
  
      
    ) dbt_internal_test