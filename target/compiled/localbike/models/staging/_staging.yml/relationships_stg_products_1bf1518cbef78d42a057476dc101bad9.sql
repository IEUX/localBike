
    
    

with child as (
    select category_id as from_field
    from "neondb"."dbt_localbike"."stg_products"
    where category_id is not null
),

parent as (
    select category_id as to_field
    from "neondb"."dbt_localbike"."stg_categories"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


