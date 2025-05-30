# ETL + dbt + Snowflake: Sales Prediction Project

Este projeto tem como objetivo construir um pipeline moderno de dados utilizando **dbt (data build tool)** com **Snowflake** como data warehouse, realizando transformações e modelagem preditiva sobre os dados de vendas do conjunto **BigMart Sales**.

---

##  Stack Tecnológica

| Camada | Ferramenta |
|--------|-------------|
| Data Warehouse | Snowflake |
| Transformações SQL | dbt |
| Análise Preditiva | Python (Jupyter Notebook) |
| Gerenciador de Dependências | Poetry |
| Versionamento | Git + GitHub |

---

##  Objetivo do Projeto

- Construir um **pipeline ETL moderno** com dbt.
- Modelar os dados com **camadas bronze, prata e ouro**.
- Prever vendas de produtos com um modelo de **machine learning supervisionado**.
- Armazenar os dados transformados e previsões no **Snowflake**.

---

##  Estrutura do Projeto
![image](https://github.com/user-attachments/assets/3eb95088-4f83-4ab4-b5b4-c4a84764cb28)
2. Configurar ambiente dbt + Snowflake
Cria um ficheiro ~/.dbt/profiles.yml com o seguinte conteúdo:
etl_dbt_sales:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <teu_account>.snowflakecomputing.com
      user: <teu_usuario>
      password: <tua_senha>
      role: <teu_role>
      database: <teu_database>
      warehouse: <teu_warehouse>
      schema: <teu_schema>
      threads: 4
## Instala as dependências dbt:
poetry install

## Compila e executa os modelos:
dbt debug
dbt run
dbt test
dbt docs generate

## Modelagem Preditiva
O notebook Big-Mart-Sales-Prediction.ipynb contém:
Limpeza e preparação de dados.
Exploração das variáveis.
Criação de features.
Treinamento de um modelo preditivo (e.g. Regressão Linear, XGBoost).
Geração de previsões integradas com Snowflake (via connector Python).


## Licença
Este projeto está licenciado sob a MIT License.





### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices



