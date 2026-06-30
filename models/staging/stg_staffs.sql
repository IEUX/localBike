with source as (
    select * from {{ source('bikestores', 'staffs') }}
),

renamed as (
    select
        staff_id::int          as staff_id,
        trim(first_name)::text as first_name,
        trim(last_name)::text  as last_name,
        trim(email)::text      as email,
        trim(phone)::text      as phone,
        (active::int = 1)      as is_active,
        store_id::int          as store_id,
        -- top manager has the literal string 'NULL' instead of a real id
        nullif(manager_id, 'NULL')::int as manager_id
    from source
)

select * from renamed
