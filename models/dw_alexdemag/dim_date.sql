{{ config(
    materialized="incremental",
    unique_key="d_date"
    ) }}

select distinct
    {{ dbt_utils.generate_surrogate_key(['o_orderdate']) }} as SK_DATE,
    o_orderdate as d_date,
    year(o_orderdate) as d_year,
    month(o_orderdate) as d_month,
    day(o_orderdate) as d_day,
    dayname(o_orderdate) as d_dayname,
    dayofweek(o_orderdate) as d_dayofweek,
    quarter(o_orderdate) as d_quarter,
    dayofyear(o_orderdate) as d_dayofyear
from snowflake_sample_data.tpch_sf1.orders