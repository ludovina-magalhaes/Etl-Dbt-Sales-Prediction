WITH ranked_outlets AS (
    SELECT
        outlet_identifier,
        outlet_establishment_year,
        outlet_size,
        outlet_location_type,
        outlet_type,
        DATE_PART('year', CURRENT_DATE) - outlet_establishment_year AS outlet_age,
        ROW_NUMBER() OVER (PARTITION BY outlet_identifier ORDER BY outlet_establishment_year) AS row_num
    FROM {{ source('etl_dbt_raw', 'TRAIN_RAW') }}
)
SELECT
    outlet_identifier,
    outlet_establishment_year,
    outlet_size,
    outlet_location_type,
    outlet_type,
    outlet_age
FROM ranked_outlets
WHERE row_num = 1

