{% snapshot dim_region %}

{{
    config(
        unique_key='REGIONKEY',
        strategy='check',
        check_cols='all',
        invalidate_hard_deletes = True
    )
}}
 
select 
    {{ dbt_utils.generate_surrogate_key(['R_REGIONKEY']) }} as SK_REGIONKEY,
    R_REGIONKEY AS REGIONKEY,
    R_NAME AS NAME,
    R_COMMENT AS COMMENT
from snowflake_sample_data.tpch_sf1.region
        
{% endsnapshot %}