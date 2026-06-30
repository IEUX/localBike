with source as (
    select * from {{ source('bikestores', 'customers') }}
),

renamed as (
    select
        cast(customer_id as {{ dbt.type_int() }})         as customer_id,
        cast(trim(first_name) as {{ dbt.type_string() }}) as first_name,
        cast(trim(last_name) as {{ dbt.type_string() }})  as last_name,
        cast(trim(phone) as {{ dbt.type_string() }})      as phone,
        cast(trim(email) as {{ dbt.type_string() }})      as email,
        cast(trim(street) as {{ dbt.type_string() }})     as street,
        cast(trim(city) as {{ dbt.type_string() }})       as city,
        cast(trim(state) as {{ dbt.type_string() }})      as state,
        cast(zip_code as {{ dbt.type_int() }})            as zip_code
    from source
)

select * from renamed
