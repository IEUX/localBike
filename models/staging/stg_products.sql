with source as (
    select * from {{ source('bikestores', 'products') }}
),

renamed as (
    select
        product_id::int            as product_id,
        trim(product_name)::text   as product_name,
        brand_id::int              as brand_id,
        category_id::int           as category_id,
        model_year::int            as model_year,
        list_price::numeric(10, 2) as list_price
    from source
)

select * from renamed
