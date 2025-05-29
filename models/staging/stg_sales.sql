SELECT
  item_identifier,
  outlet_identifier,
  item_outlet_sales
FROM {{ source('etl_dbt_raw', 'TRAIN_RAW') }}

