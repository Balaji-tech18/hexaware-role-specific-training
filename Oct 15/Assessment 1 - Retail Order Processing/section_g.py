import pandas as pd

orders = pd.read_csv("orders.csv")
print(orders.head())
print(orders.columns)
print(orders.dtypes)
print(orders.shape)
print(orders.query("status == 'Delivered'"))
print(orders.query("quantity > 2"))
orders["order_value"] = orders["quantity"] * orders["unit_price"]
print(orders.groupby("status").size())
orders["order_date"] = pd.to_datetime(orders["order_date"])
orders["month"] = orders["order_date"].dt.to_period("M").astype(str)
print(orders.groupby(["month", "status"]).size())
print(orders.groupby("category")["order_value"].sum())
print(orders.groupby("category")["order_value"].mean())
print(orders.sort_values("order_value", ascending=False))
