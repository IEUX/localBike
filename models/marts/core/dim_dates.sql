{#
    Date dimension covering the order history (2016-2018). Built from a
    dbt_utils date spine; only ANSI `extract()` + dbt cross-db `date_trunc`
    are used so it runs on both Postgres (local) and BigQuery (prod).
#}
with spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2016-01-01' as date)",
        end_date="cast('2019-01-01' as date)"
    ) }}
)

select
    cast(date_day as date)                         as date_day,
    extract(year from date_day)::int               as year,
    extract(quarter from date_day)::int            as quarter,
    extract(month from date_day)::int              as month,
    extract(day from date_day)::int                as day_of_month,
    cast({{ dbt.date_trunc('month', 'date_day') }} as date) as month_start,
    extract(year from date_day)::int * 100
        + extract(month from date_day)::int        as year_month,
    case extract(month from date_day)::int
        when 1 then 'January'   when 2 then 'February' when 3 then 'March'
        when 4 then 'April'     when 5 then 'May'      when 6 then 'June'
        when 7 then 'July'      when 8 then 'August'   when 9 then 'September'
        when 10 then 'October'  when 11 then 'November' when 12 then 'December'
    end as month_name
from spine
