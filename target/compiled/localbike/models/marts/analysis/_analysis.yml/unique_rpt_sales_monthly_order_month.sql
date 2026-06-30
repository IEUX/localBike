
    
    

select
    order_month as unique_field,
    count(*) as n_records

from "neondb"."dbt_localbike"."rpt_sales_monthly"
where order_month is not null
group by order_month
having count(*) > 1


