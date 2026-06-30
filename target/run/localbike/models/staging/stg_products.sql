
  create view "neondb"."dbt_localbike"."stg_products__dbt_tmp"
    
    
  as (
    with source as (
    select * from "neondb"."public"."products"
),

renamed as (
    select
        cast(product_id as integer)            as product_id,
        cast(trim(product_name) as TEXT) as product_name,
        cast(brand_id as integer)              as brand_id,
        cast(category_id as integer)           as category_id,
        cast(model_year as integer)            as model_year,
        cast(list_price as numeric)                         as list_price
    from source
)

select * from renamed
  );