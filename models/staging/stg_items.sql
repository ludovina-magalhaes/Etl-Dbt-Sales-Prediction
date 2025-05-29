WITH ranked_items AS (
    SELECT
        item_identifier,
        COALESCE(item_weight, 0) AS item_weight,
        CASE
            WHEN LOWER(item_fat_content) IN ('low fat', 'lf', 'lowfat') THEN 'Low Fat'
            WHEN LOWER(item_fat_content) IN ('reg', 'regular') THEN 'Regular'
            WHEN LOWER(item_fat_content) = 'non-edible' THEN 'Non-Edible'
            ELSE 'Unknown'
        END AS item_fat_content,
        item_visibility,
        item_type,
        item_mrp,
        ROW_NUMBER() OVER (PARTITION BY item_identifier ORDER BY item_mrp DESC) AS row_num
    FROM {{ source('etl_dbt_raw', 'TRAIN_RAW') }}
)
SELECT
    item_identifier,
    item_weight,
    item_fat_content,
    item_visibility,
    item_type,
    item_mrp
FROM ranked_items
WHERE row_num = 1


