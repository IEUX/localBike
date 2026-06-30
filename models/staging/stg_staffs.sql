with source as (
    select * from {{ source('bikestores', 'staffs') }}
),

renamed as (
    select
        cast(staff_id as {{ dbt.type_int() }})            as staff_id,
        cast(trim(first_name) as {{ dbt.type_string() }}) as first_name,
        cast(trim(last_name) as {{ dbt.type_string() }})  as last_name,
        cast(trim(email) as {{ dbt.type_string() }})      as email,
        cast(trim(phone) as {{ dbt.type_string() }})      as phone,
        (cast(active as {{ dbt.type_int() }}) = 1)        as is_active,
        cast(store_id as {{ dbt.type_int() }})            as store_id,
        -- top manager has the literal string 'NULL' instead of a real id
        cast(nullif(manager_id, 'NULL') as {{ dbt.type_int() }}) as manager_id
    from source
)

select * from renamed
