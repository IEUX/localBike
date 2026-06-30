
  create view "neondb"."dbt_localbike"."stg_stores__dbt_tmp"
    
    
  as (
    with source as (
    select * from "neondb"."public"."stores"
),

renamed as (
    select
        cast(store_id as integer)            as store_id,
        cast(trim(store_name) as TEXT) as store_name,
        cast(trim(phone) as TEXT)      as phone,
        cast(trim(email) as TEXT)      as email,
        cast(trim(street) as TEXT)     as street,
        cast(trim(city) as TEXT)       as city,
        cast(trim(state) as TEXT)      as state,
        cast(zip_code as integer)            as zip_code
    from source
)

select * from renamed
  );