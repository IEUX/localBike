
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select is_fulfilled
from "neondb"."dbt_localbike_seed"."seed_order_status"
where is_fulfilled is null



  
  
      
    ) dbt_internal_test