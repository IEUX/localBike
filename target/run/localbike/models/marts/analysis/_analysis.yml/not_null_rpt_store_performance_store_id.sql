
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select store_id
from "neondb"."dbt_localbike"."rpt_store_performance"
where store_id is null



  
  
      
    ) dbt_internal_test