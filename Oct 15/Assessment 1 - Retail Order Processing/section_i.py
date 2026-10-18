import numpy as np
import pandas as pd

customers = pd.read_csv("customers.csv")
orders = pd.read_csv("orders.csv")
orders["order_value"] = orders["quantity"] * orders["unit_price"]
joined = orders.merge(customers, on="customer_id", how="inner")
joined["order_size"] = np.select(
    [joined["order_value"] >= 50000, joined["order_value"] >= 15000],
    ["High", "Medium"],
    default="Low"
)
joined["priority_customer"] = np.where(joined["segment"] == "Corporate", "Priority", "Normal")
joined.to_csv("enriched_orders.csv", index=False)
print(joined)
