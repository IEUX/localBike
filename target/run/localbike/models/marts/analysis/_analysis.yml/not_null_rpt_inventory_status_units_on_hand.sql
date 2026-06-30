
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select units_on_hand
from "neondb"."dbt_localbike"."rpt_inventory_status"
where units_on_hand is null



  
  
      
    ) dbt_internal_test