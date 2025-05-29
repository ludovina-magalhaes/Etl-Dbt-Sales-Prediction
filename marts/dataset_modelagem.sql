-- models/marts/bigmart/mart_dataset_modelagem.sql

with base as (
    select * from {{ ref('int_vendas') }}
),

-- Exemplo de engenharia de features simples
features as (
    select
        *,
        
        -- Exemplo de feature: categoria de preço
        case 
            when item_mrp < 70 then 'baixo'
            when item_mrp between 70 and 150 then 'medio'
            else 'alto'
        end as faixa_preco,

        -- Normalização de visibilidade
        item_visibility / nullif(item_weight, 0) as visibilidade_ajustada

    from base
)

select * from features
