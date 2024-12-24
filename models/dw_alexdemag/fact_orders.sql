{{ config(
    materialized="incremental",
    unique_key="orderkey"
    ) }}

select
    {{ dbt_utils.generate_surrogate_key(['o.o_orderkey']) }} fk_order,
    {{ dbt_utils.generate_surrogate_key(['o.o_custkey']) }} as sk_custkey,
    {{ dbt_utils.generate_surrogate_key(['c.c_nationkey']) }} as sk_nationkey,
    {{ dbt_utils.generate_surrogate_key(['n.n_regionkey']) }} as sk_regionkey,
    o.o_orderkey as orderkey,
    o.o_orderstatus as o_orderstatus,
    o.o_totalprice as totalprice,
    {{ dbt_utils.generate_surrogate_key(['o.o_orderdate']) }} as sk_date,
    o.o_orderpriority as orderpriority,
    o.o_clerk as clerk,
    o.o_shippriority as shippriority,
    o.o_comment as comment
from snowflake_sample_data.tpch_sf1.orders o
join snowflake_sample_data.tpch_sf1.customer c on o.o_custkey = c.c_custkey
join snowflake_sample_data.tpch_sf1.nation n on n.n_nationkey = c.c_nationkey