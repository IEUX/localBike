
    
    

with child as (
    select staff_id as from_field
    from "neondb"."dbt_localbike"."stg_orders"
    where staff_id is not null
),

parent as (
    select staff_id as to_field
    from "neondb"."dbt_localbike"."stg_staffs"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


