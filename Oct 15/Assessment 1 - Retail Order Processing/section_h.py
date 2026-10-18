import pandas as pd

customers = pd.read_csv("customers.csv")
orders = pd.read_csv("orders.csv")
orders["order_value"] = orders["quantity"] * orders["unit_price"]
joined = orders.merge(customers, on="customer_id", how="inner")
print(joined[["order_id", "customer_name", "city", "product", "status", "order_value"]])
print(joined.query("status == 'Delivered' and city == 'Hyderabad'"))
summary = joined.groupby("city").agg(
    total_orders=("order_id", "count"),
    total_sales=("order_value", "sum"),
    average_order_value=("order_value", "mean")
).reset_index()
summary = summary.sort_values("total_sales", ascending=False)
print(summary)
summary.to_csv("city_sales_summary.csv", index=False)
summary.to_json("city_sales_summary.json", orient="records", indent=2)
