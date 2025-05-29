-- models/marts/bigmart/mart_vendas_por_tipo_item.sql

with base as (
    select * from {{ ref('int_vendas') }}
)

select
    item_type,
    sum(item_outlet_sales) as total_vendas,
    avg(item_outlet_sales) as media_vendas,
    count(*) as qtd_registros
from base
group by item_type
order by total_vendas desc
