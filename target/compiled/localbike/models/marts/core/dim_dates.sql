
with spine as (
    





with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
     + 
    
    p5.generated_number * power(2, 5)
     + 
    
    p6.generated_number * power(2, 6)
     + 
    
    p7.generated_number * power(2, 7)
     + 
    
    p8.generated_number * power(2, 8)
     + 
    
    p9.generated_number * power(2, 9)
     + 
    
    p10.generated_number * power(2, 10)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
     cross join 
    
    p as p7
     cross join 
    
    p as p8
     cross join 
    
    p as p9
     cross join 
    
    p as p10
    
    

    )

    select *
    from unioned
    where generated_number <= 1096
    order by generated_number



),

all_periods as (

    select (
        

    cast('2016-01-01' as date) + ((interval '1 day') * (row_number() over (order by generated_number) - 1))


    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= cast('2019-01-01' as date)

)

select * from filtered


)

select
    cast(date_day as date)                                       as date_day,
    cast(extract(year from date_day) as integer)    as year,
    cast(extract(quarter from date_day) as integer) as quarter,
    cast(extract(month from date_day) as integer)   as month,
    cast(extract(day from date_day) as integer)     as day_of_month,
    cast(date_trunc('month', date_day) as date)      as month_start,
    cast(extract(year from date_day) as integer) * 100
        + cast(extract(month from date_day) as integer) as year_month,
    case cast(extract(month from date_day) as integer)
        when 1 then 'January'   when 2 then 'February' when 3 then 'March'
        when 4 then 'April'     when 5 then 'May'      when 6 then 'June'
        when 7 then 'July'      when 8 then 'August'   when 9 then 'September'
        when 10 then 'October'  when 11 then 'November' when 12 then 'December'
    end as month_name
from spine