
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_status_code
from "neondb"."dbt_localbike"."stg_orders"
where order_status_code is null



  
  
      
    ) dbt_internal_test