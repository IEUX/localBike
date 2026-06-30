with source as (
    select * from {{ source('bikestores', 'brands') }}
),

renamed as (
    select
        cast(brand_id as {{ dbt.type_int() }})            as brand_id,
        cast(trim(brand_name) as {{ dbt.type_string() }}) as brand_name
    from source
)

select * from renamed
