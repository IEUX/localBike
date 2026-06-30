with source as (
    select * from {{ source('bikestores', 'products') }}
),

renamed as (
    select
        cast(product_id as {{ dbt.type_int() }})            as product_id,
        cast(trim(product_name) as {{ dbt.type_string() }}) as product_name,
        cast(brand_id as {{ dbt.type_int() }})              as brand_id,
        cast(category_id as {{ dbt.type_int() }})           as category_id,
        cast(model_year as {{ dbt.type_int() }})            as model_year,
        cast(list_price as numeric)                         as list_price
    from source
)

select * from renamed
