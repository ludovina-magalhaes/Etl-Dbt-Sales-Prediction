#  ETL + dbt + Snowflake: Proyecto de Predicción de Ventas

Este proyecto tiene como objetivo construir un pipeline moderno de datos utilizando **dbt (data build tool)** con **Snowflake** como data warehouse, realizando transformaciones y modelado predictivo sobre los datos de ventas del conjunto **BigMart Sales**.

---

##  Stack Tecnológico

| Capa                  | Herramienta               |
|-----------------------|---------------------------|
| Data Warehouse        | ❄️ Snowflake              |
| Transformaciones SQL  | 📦 dbt                     |
| Análisis Predictivo   | 🐍 Python (Jupyter Notebook) |
| Gestión de Dependencias | Poetry                 |
| Control de Versiones  | Git + GitHub              |

---

## Objetivo del Proyecto

- Construir un **pipeline ETL moderno** con dbt.
- Modelar los datos en **capas bronce, plata y oro**.
- Predecir ventas de productos utilizando un modelo de **machine learning supervisado**.
- Almacenar los datos transformados y las predicciones en **Snowflake**.

---

##  Estructura del Proyecto

```
Etl-Dbt-Sales-Prediction/
│
├── models/
│   ├── staging/         # Capa Bronce
│   ├── intermediate/    # Capa Plata
│   └── marts/           # Capa Oro (mart de predicción)
│
├── seeds/               # Datos fijos o de referencia
├── snapshots/           # Versionado histórico (si aplica)
├── macros/              # Funciones reutilizables
├── tests/               # Tests de calidad de datos
│
├── Big-Mart-Sales-Prediction.ipynb  # Notebook de machine learning
├── pyproject.toml       # Configuración de Poetry
├── README.md            # Este archivo
```

---

##  Cómo Ejecutar

### 1. Clonar el repositorio

```bash
git clone https://github.com/ludovina-magalhaes/Etl-Dbt-Sales-Prediction.git
cd Etl-Dbt-Sales-Prediction
```

### 2. Configurar entorno dbt + Snowflake

Crea un archivo `~/.dbt/profiles.yml` con el siguiente contenido:

```yaml
etl_dbt_sales:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <tu_cuenta>.snowflakecomputing.com
      user: <tu_usuario>
      password: <tu_contraseña>
      role: <tu_rol>
      database: <tu_base_de_datos>
      warehouse: <tu_almacen>
      schema: <tu_esquema>
      threads: 4
```

>  Recomendación: usa variables de entorno o dbt Cloud para mayor seguridad.

### 3. Instalar las dependencias dbt

```bash
poetry install
```

### 4. Ejecutar el pipeline

```bash
dbt debug
dbt run
dbt test
dbt docs generate
```

---

## 🔬 Pruebas y Documentación

###  Tests de calidad de datos

Se han añadido tests `not_null`, `unique`, y otros para garantizar la integridad de los datos en los modelos dbt.

Ejemplo (`schema.yml`):

```yaml
models:
  - name: sales_final
    description: "Tabla final con datos de ventas preparados para predicción."
    columns:
      - name: id_venta
        description: "Identificador único de la venta."
        tests: [not_null, unique]
      - name: fecha_venta
        description: "Fecha en la que ocurrió la venta."
        tests: [not_null]
```

###  Documentación

Todos los modelos y columnas están documentados utilizando `description` y bloques `docs`. La documentación puede visualizarse con:

```bash
dbt docs generate
dbt docs serve
```

---

##  Modelado Predictivo

El notebook `Big-Mart-Sales-Prediction.ipynb` contiene:

- Limpieza y preparación de los datos.
- Exploración de variables.
- Creación de características (features).
- Entrenamiento de un modelo predictivo (por ejemplo, Regresión Lineal, XGBoost).
- Generación de predicciones integradas con Snowflake (a través del conector de Python).

---

##  Licencia

Este proyecto está licenciado bajo la licencia **MIT**.

---

## 📚 Recursos Útiles

- [Documentación oficial de dbt](https://docs.getdbt.com/)
- [Foro dbt Discourse](https://discourse.getdbt.com/)
- [Comunidad dbt en Slack](https://community.getdbt.com/)
- [Eventos dbt cerca de ti](https://events.getdbt.com/)
- [Blog oficial de dbt](https://www.getdbt.com/blog/)
