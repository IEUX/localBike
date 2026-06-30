with source as (
    select * from {{ source('bikestores', 'stocks') }}
),

renamed as (
    select
        store_id::int   as store_id,
        product_id::int as product_id,
        quantity::int   as quantity
    from source
)

select * from renamed
