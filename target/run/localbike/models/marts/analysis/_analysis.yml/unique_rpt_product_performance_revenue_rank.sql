
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    revenue_rank as unique_field,
    count(*) as n_records

from "neondb"."dbt_localbike"."rpt_product_performance"
where revenue_rank is not null
group by revenue_rank
having count(*) > 1



  
  
      
    ) dbt_internal_test