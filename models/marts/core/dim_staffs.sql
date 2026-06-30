with staffs as (
    select * from {{ ref('stg_staffs') }}
),

stores as (
    select * from {{ ref('stg_stores') }}
)

select
    s.staff_id,
    s.first_name,
    s.last_name,
    s.first_name || ' ' || s.last_name as full_name,
    s.email,
    s.phone,
    s.is_active,
    s.store_id,
    st.store_name,
    s.manager_id,
    m.first_name || ' ' || m.last_name as manager_name
from staffs s
left join stores st on s.store_id = st.store_id
left join staffs m on s.manager_id = m.staff_id
