import snowflake.connector
import pandas as pd

# Snowflake connection details
conn = snowflake.connector.connect(
    user='your_username',
    password='your_password',
    account='your_account',
    warehouse='your_warehouse',
    database='your_database',
    schema='your_schema'
)

# Function to load a CSV file into a Snowflake table
def load_csv_to_snowflake(csv_file, table_name):
    df = pd.read_csv(csv_file)
    cursor = conn.cursor()

    # Prepare SQL insert statement
    columns = ",".join(df.columns)
    values = ",".join(["%s"] * len(df.columns))
    sql = f"INSERT INTO {table_name} ({columns}) VALUES ({values})"

    # Insert each row into the Snowflake table
    for i, row in df.iterrows():
        cursor.execute(sql, tuple(row))

    conn.commit()
    cursor.close()
    print(f"Data loaded into {table_name}")

# Load data into Snowflake tables
load_csv_to_snowflake('customers.csv', 'customers')
load_csv_to_snowflake('products.csv', 'products')
load_csv_to_snowflake('orders.csv', 'orders')
load_csv_to_snowflake('order_details.csv', 'order_details')

conn.close()
