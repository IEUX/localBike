
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    staff_id as unique_field,
    count(*) as n_records

from "neondb"."dbt_localbike"."dim_staffs"
where staff_id is not null
group by staff_id
having count(*) > 1



  
  
      
    ) dbt_internal_test