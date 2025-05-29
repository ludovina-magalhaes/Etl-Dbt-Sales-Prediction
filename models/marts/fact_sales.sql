-- models/marts/core/fact_sales.sql

SELECT
    s.item_identifier,
    s.outlet_identifier,
    s.item_outlet_sales,
    i.item_type,
    i.item_fat_content,
    i.item_weight,
    o.outlet_location_type,
    o.outlet_type,
    o.outlet_size
FROM {{ ref('stg_sales') }} s
JOIN {{ ref('stg_items') }} i
    ON s.item_identifier = i.item_identifier
JOIN {{ ref('stg_outlets') }} o
    ON s.outlet_identifier = o.outlet_identifier
