with source as (
    select * from {{ source('bikestores', 'categories') }}
),

renamed as (
    select
        category_id::int          as category_id,
        trim(category_name)::text as category_name
    from source
)

select * from renamed
