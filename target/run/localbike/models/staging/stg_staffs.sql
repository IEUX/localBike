
  create view "neondb"."dbt_localbike"."stg_staffs__dbt_tmp"
    
    
  as (
    with source as (
    select * from "neondb"."public"."staffs"
),

renamed as (
    select
        cast(staff_id as integer)            as staff_id,
        cast(trim(first_name) as TEXT) as first_name,
        cast(trim(last_name) as TEXT)  as last_name,
        cast(trim(email) as TEXT)      as email,
        cast(trim(phone) as TEXT)      as phone,
        (cast(active as integer) = 1)        as is_active,
        cast(store_id as integer)            as store_id,
        -- top manager has the literal string 'NULL' instead of a real id
        cast(nullif(manager_id, 'NULL') as integer) as manager_id
    from source
)

select * from renamed
  );