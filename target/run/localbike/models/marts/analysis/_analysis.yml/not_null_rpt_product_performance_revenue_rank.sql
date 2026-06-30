
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select revenue_rank
from "neondb"."dbt_localbike"."rpt_product_performance"
where revenue_rank is null



  
  
      
    ) dbt_internal_test