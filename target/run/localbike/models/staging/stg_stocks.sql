
  create view "neondb"."dbt_localbike"."stg_stocks__dbt_tmp"
    
    
  as (
    with source as (
    select * from "neondb"."public"."stocks"
),

renamed as (
    select
        cast(store_id as integer)   as store_id,
        cast(product_id as integer) as product_id,
        cast(quantity as integer)   as quantity
    from source
)

select * from renamed
  );