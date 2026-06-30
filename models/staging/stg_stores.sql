with source as (
    select * from {{ source('bikestores', 'stores') }}
),

renamed as (
    select
        cast(store_id as {{ dbt.type_int() }})            as store_id,
        cast(trim(store_name) as {{ dbt.type_string() }}) as store_name,
        cast(trim(phone) as {{ dbt.type_string() }})      as phone,
        cast(trim(email) as {{ dbt.type_string() }})      as email,
        cast(trim(street) as {{ dbt.type_string() }})     as street,
        cast(trim(city) as {{ dbt.type_string() }})       as city,
        cast(trim(state) as {{ dbt.type_string() }})      as state,
        cast(zip_code as {{ dbt.type_int() }})            as zip_code
    from source
)

select * from renamed
