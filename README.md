# Tech Challenge Fase 3
---
# AWS Tech Challenge: State of Data Brazil (2023-2025)

## Sobre o Projeto
Um pipeline automatizado de Engenharia de Dados focado em analisar o mercado de tecnologia brasileiro. O projeto processa as pesquisas do **Data Hackers (2023 a 2025)** na AWS, transformando dados brutos em insights estratégicos para negócios.

## Stack Tecnológico
* **Storage:** Amazon S3 (Data Lake)
* **Processamento:** AWS Glue & PySpark (ETL e Limpeza)
* **Catálogo e Consulta:** AWS Glue Data Catalog & Amazon Athena (SQL Serverless)
* **DataViz:** Python (Pandas, Matplotlib, Seaborn)

## Arquitetura Medallion
O fluxo de dados foi estruturado em três camadas no S3:

* **Camada Bronze (Raw):** Ingestão dos arquivos originais da pesquisa (CSV).
* **Camada Silver (Clean):** Tratamento de dados, correção de tipagem e conversão para formato colunar otimizado (Parquet) usando Glue Jobs.
* **Camada Gold (Business):** Tabelas agregadas respondendo exclusivamente às perguntas de negócio.

## Principais Insights (O que analisamos?)
A camada analítica (Gold) e o Dashboard em Python respondem às seguintes questões do mercado:
1. **Demografia:** O cenário de diversidade de gênero e raça na área de dados.
2. **Experiência:** A maturidade e o tempo de atuação dos profissionais.
3. **Trabalho:** A transição dos modelos Remoto, Híbrido e Presencial.
4. **Remuneração:** A evolução e distribuição salarial por nível de senioridade.
5. **Tecnologia:** As ferramentas (Python, SQL) e provedores Cloud (AWS, Azure) mais utilizados.
6. **Inovação:** Como diferentes setores estão adotando a Inteligência Artificial Generativa.
