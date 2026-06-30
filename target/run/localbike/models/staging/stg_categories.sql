
  create view "neondb"."dbt_localbike"."stg_categories__dbt_tmp"
    
    
  as (
    with source as (
    select * from "neondb"."public"."categories"
),

renamed as (
    select
        cast(category_id as integer)            as category_id,
        cast(trim(category_name) as TEXT) as category_name
    from source
)

select * from renamed
  );