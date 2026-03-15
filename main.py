import sqlite3
import pandas as pd
import os

# Connect to the database

conn = sqlite3.connect("olist.db")

# Load each CSV from the data folder into the database

data_folder ="data"

for filename in os.listdir(data_folder):
    if filename.endswith(".csv"):
        table_name = filename.replace(".csv", "").replace("olist_", "").replace("_dataset", "")
        df = pd.read_csv(os.path.join(data_folder, filename))
        df.to_sql(table_name, conn, if_exists="replace", index=False)
        print(f"Loaded:{table_name} ({len(df)} rows)")

print("\nAll tables loaded successfully!")

# Run each SQL query and export results to outputs folder
os.makedirs("outputs", exist_ok=True)
queries_folder = "queries"

for filename in os.listdir(queries_folder):
    if filename.endswith(".sql"):
        query_name = filename.replace(".sql", "")

        # Read the SQL file
        with open(os.path.join(queries_folder, filename), "r") as f:
            sql = f.read()

        # Run the query and save result as CSV
        result = pd.read_sql_query(sql, conn)
        output_path = os.path.join("outputs", f"{query_name}.csv")
        result.to_csv(output_path, index=False)
        print(f"Query done: {query_name} -> {len(result)} rows exported")

conn.close()
print("\nAll done. Check the outputs folder for your CSVs")
