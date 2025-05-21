with sales_data as (
    select * from {{ ref('stg_train') }}
)

select
    item_type,
    outlet_type,
    round(avg(sales), 2) as avg_sales,
    round(sum(sales), 2) as total_sales,
    count(*) as num_registros
from sales_data
group by item_type, outlet_type
order by total_sales desc
