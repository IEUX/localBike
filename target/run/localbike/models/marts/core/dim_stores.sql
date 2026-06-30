
  
    

  create  table "neondb"."dbt_localbike"."dim_stores__dbt_tmp"
  
  
    as
  
  (
    select
    store_id,
    store_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
from "neondb"."dbt_localbike"."stg_stores"
  );
  