
  create view "neondb"."dbt_localbike"."stg_customers__dbt_tmp"
    
    
  as (
    with source as (
    select * from "neondb"."public"."customers"
),

renamed as (
    select
        cast(customer_id as integer)         as customer_id,
        cast(trim(first_name) as TEXT) as first_name,
        cast(trim(last_name) as TEXT)  as last_name,
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