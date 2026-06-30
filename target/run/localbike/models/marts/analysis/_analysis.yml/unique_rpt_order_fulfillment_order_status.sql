
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    order_status as unique_field,
    count(*) as n_records

from "neondb"."dbt_localbike"."rpt_order_fulfillment"
where order_status is not null
group by order_status
having count(*) > 1



  
  
      
    ) dbt_internal_test