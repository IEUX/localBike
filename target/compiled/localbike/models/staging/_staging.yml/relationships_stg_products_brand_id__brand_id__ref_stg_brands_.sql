
    
    

with child as (
    select brand_id as from_field
    from "neondb"."dbt_localbike"."stg_products"
    where brand_id is not null
),

parent as (
    select brand_id as to_field
    from "neondb"."dbt_localbike"."stg_brands"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


