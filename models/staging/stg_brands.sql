with source as (
    select * from {{ source('bikestores', 'brands') }}
),

renamed as (
    select
        brand_id::int          as brand_id,
        trim(brand_name)::text as brand_name
    from source
)

select * from renamed
