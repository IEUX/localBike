
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantity
from "neondb"."dbt_localbike"."stg_stocks"
where quantity is null



  
  
      
    ) dbt_internal_test