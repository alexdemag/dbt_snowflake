{% snapshot dim_nation %}

{{
    config(
        unique_key='NATIONKEY',
        strategy='check',
        check_cols='all',
        invalidate_hard_deletes = True
    )
}}

select 
    {{ dbt_utils.generate_surrogate_key(['N_NATIONKEY']) }} as SK_NATIONKEY,
    N_NATIONKEY AS NATIONKEY,
    N_NAME AS NAME,
    N_REGIONKEY AS REGIONKEY,
    N_COMMENT AS COMMENT,
    from snowflake_sample_data.tpch_sf1.nation
    
{% endsnapshot %}