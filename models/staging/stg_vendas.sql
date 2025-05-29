-- models/staging/star_vendas.sql
-- Camada Raw: exposição simples dos dados originais da tabela TRAIN_RAW

{{ config(
    materialized='table'  
) }}

with raw_vendas as (

    select * 
    from {{ source('etl_dbt_raw', 'TRAIN_RAW') }}

),

vendas as (

    select
        ITEM_IDENTIFIER,
        ITEM_WEIGHT,
        COALESCE(ITEM_WEIGHT, 0) as ITEM_WEIGHT_TRATADO,
        ITEM_FAT_CONTENT,
        case 
            when lower(ITEM_FAT_CONTENT) in ('low fat', 'lf') then 'Low Fat'
            when lower(ITEM_FAT_CONTENT) in ('regular', 'reg') then 'Regular'
            when lower(ITEM_FAT_CONTENT) = 'non-edible' then 'Non-Edible'
            else ITEM_FAT_CONTENT
        end as ITEM_FAT_CONTENT_TRATADO,
        ITEM_VISIBILITY,
        ITEM_TYPE,
        ITEM_MRP,
        OUTLET_IDENTIFIER,
        OUTLET_ESTABLISHMENT_YEAR,
        OUTLET_SIZE,
        OUTLET_LOCATION_TYPE,
        OUTLET_TYPE,
        ITEM_OUTLET_SALES
    from raw_vendas
    

)

select *
from vendas
