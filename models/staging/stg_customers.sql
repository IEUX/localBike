with source as (
    select * from {{ source('bikestores', 'customers') }}
),

renamed as (
    select
        customer_id::int       as customer_id,
        trim(first_name)::text as first_name,
        trim(last_name)::text  as last_name,
        trim(phone)::text      as phone,
        trim(email)::text      as email,
        trim(street)::text     as street,
        trim(city)::text       as city,
        trim(state)::text      as state,
        zip_code::int          as zip_code
    from source
)

select * from renamed
