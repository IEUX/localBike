with source as (
    select * from {{ source('bikestores', 'stocks') }}
),

renamed as (
    select
        cast(store_id as {{ dbt.type_int() }})   as store_id,
        cast(product_id as {{ dbt.type_int() }}) as product_id,
        cast(quantity as {{ dbt.type_int() }})   as quantity
    from source
)

select * from renamed
