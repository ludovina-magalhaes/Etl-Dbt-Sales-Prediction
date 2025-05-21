with source as (
    select * from {{ source('etl_dbt_raw', 'TRAIN_RAW') }}
),


renamed as (
    select
        Item_Identifier as item_id,
        Item_Weight as item_weight,
        Item_Fat_Content as fat_content,
        Item_Visibility as visibility,
        Item_Type as item_type,
        Item_MRP as item_mrp,
        Outlet_Identifier as outlet_id,
        cast(Outlet_Establishment_Year as number) as establishment_year,
        Outlet_Size as outlet_size,
        Outlet_Location_Type as location_type,
        Outlet_Type as outlet_type,
        Item_Outlet_Sales as sales
    from source
)

select * from renamed
