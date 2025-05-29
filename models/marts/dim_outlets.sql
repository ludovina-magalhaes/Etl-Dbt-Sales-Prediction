-- models/marts/core/dim_outlets.sql

SELECT DISTINCT
    outlet_identifier,
    outlet_location_type,
    outlet_type,
    outlet_size,
    outlet_establishment_year,
    DATE_PART('year', CURRENT_DATE) - outlet_establishment_year AS outlet_age
FROM {{ ref('stg_outlets') }}
