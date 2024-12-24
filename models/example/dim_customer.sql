
{{ config(materialized='table') }}
select 
    {{ dbt_utils.generate_surrogate_key(['C_CUSTKEY']) }} as SK_CUSTKEY,
    C_CUSTKEY AS CUSTKEY,
    C_NAME AS NAME,
    C_ADDRESS AS ADDRESS,
    C_NATION_KEY AS NATION_KEY,
    C_PHONE AS PHONE,
    C_ACCTBAL AS ACCOUNT_BALANCE,
    C_MKTSEGMENT AS MARKETING_SEGMENT,
    C_COMMENT AS COMMENT
from snowflake_sample_data.tpch_sf1.customer