-- models/marts/bigmart/mart_performance_lojas.sql

with base as (
    select * from {{ ref('int_vendas') }}
)


