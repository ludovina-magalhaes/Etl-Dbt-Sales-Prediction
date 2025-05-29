-- models/marts/core/dim_items.sql

SELECT DISTINCT
    item_identifier,
    item_type,
    item_fat_content,
    item_weight,
    item_mrp
FROM {{ ref('stg_items') }}
