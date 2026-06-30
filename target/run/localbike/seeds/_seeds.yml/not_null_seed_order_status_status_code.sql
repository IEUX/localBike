
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select status_code
from "neondb"."dbt_localbike_seed"."seed_order_status"
where status_code is null



  
  
      
    ) dbt_internal_test