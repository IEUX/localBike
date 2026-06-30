
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        order_status_code as value_field,
        count(*) as n_records

    from "neondb"."dbt_localbike"."stg_orders"
    group by order_status_code

)

select *
from all_values
where value_field not in (
    '1','2','3','4'
)



  
  
      
    ) dbt_internal_test