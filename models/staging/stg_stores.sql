with source as (
    select * from {{ source('bikestores', 'stores') }}
),

renamed as (
    select
        store_id::int          as store_id,
        trim(store_name)::text as store_name,
        trim(phone)::text      as phone,
        trim(email)::text      as email,
        trim(street)::text     as street,
        trim(city)::text       as city,
        trim(state)::text      as state,
        zip_code::int          as zip_code
    from source
)

select * from renamed
