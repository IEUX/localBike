
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select list_price
from "neondb"."dbt_localbike"."stg_order_items"
where list_price is null



  
  
      
    ) dbt_internal_test