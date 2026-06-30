with source as (
    select * from {{ source('bikestores', 'categories') }}
),

renamed as (
    select
        cast(category_id as {{ dbt.type_int() }})            as category_id,
        cast(trim(category_name) as {{ dbt.type_string() }}) as category_name
    from source
)

select * from renamed
