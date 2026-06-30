
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_month
from "neondb"."dbt_localbike"."rpt_sales_monthly"
where order_month is null



  
  
      
    ) dbt_internal_test