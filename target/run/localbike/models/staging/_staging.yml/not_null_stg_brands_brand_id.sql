
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select brand_id
from "neondb"."dbt_localbike"."stg_brands"
where brand_id is null



  
  
      
    ) dbt_internal_test