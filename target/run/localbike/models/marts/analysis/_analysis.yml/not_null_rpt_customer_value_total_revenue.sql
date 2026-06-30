
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_revenue
from "neondb"."dbt_localbike"."rpt_customer_value"
where total_revenue is null



  
  
      
    ) dbt_internal_test