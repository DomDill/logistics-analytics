 # Logistics Performance Analysis
An end-to-end data analytics project analyzing 100,000+ real e-commerce orders from Olist, a Brizilian marketplace. Built to answer real business questions around delivery performance, freight costs, and seller rliability.

## Live Dashboard
[View on Tableau Public](https://public.tableau.com/app/profile/qushania.dillard/viz/LogisticsPerformanceAnalysis/Dashboard1?publish=yes)

## Business Questions Answered
1. Which states have the highest late delivery rates?
2. Which product categories have the highest freight costs relative to price?
3. Which sellers have the worst cancellation and late delivery rates?
4. How have order volume and delivery performance trended month over month?

## Tools Used
- **Python** - data pipeline to load 9 CSV files into a SQLite database
- **SQL** - 4 queries to analyze delivery, freight, and seller performance
- **Tableau Public** - interactive dashboard to visualize findings

## Key Findings
- The state of MA had the highest late delivery rate at 23.93%
- Christmas/seasonal items (artigos_de_natal) had the highest freight-to-price ratio at 36%, meaning shipping costs nearly equal the product price
- The worst performing seller had a 34% late delivery rate
- Order volume peaked in late 2017 and remained high through mid- 2018.

## Project Structure
logistics-analytics/
├── queries/          # SQL query files
│   ├── late_delivery_by_state.sql
│   ├── freight_cost_by_category.sql
│   ├── seller_performance.sql
│   └── monthly_trends.sql
├── main.py           # Python pipeline to load data and run queries
└── README.md

## How to Run
1. Download the [Olist dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) from Kaggle
2. Place all CSV files in a 'data/' folder
3. Run 'python main.py' to load data and generate output CSVs
4. Open Tableau Public and connect to the CSVs in the 'outputs/' folder