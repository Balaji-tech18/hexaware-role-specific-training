import pandas as pd

shipments = pd.read_csv("shipments.csv")
print(shipments.query("status == 'Delivered'"))
print(shipments.groupby("status").size())
shipments["shipment_date"] = pd.to_datetime(shipments["shipment_date"])
shipments["month"] = shipments["shipment_date"].dt.to_period("M").astype(str)
print(shipments.groupby(["month", "status"]).size())
print(shipments.groupby("destination")["cost"].mean())
print(shipments.groupby("destination")["weight"].sum())
selected_columns = ["shipment_id", "destination", "status", "cost"]
print(pd.read_csv("shipments.csv", usecols=selected_columns))

hubs = pd.read_csv("hubs.csv")
joined = shipments.merge(hubs, on="hub_id", how="inner")
summary = joined.groupby(["hub_id", "hub_name", "city", "manager"]).agg(
    total_shipment_cost=("cost", "sum"),
    total_shipments=("shipment_id", "count")
).reset_index()
summary = summary.sort_values("total_shipment_cost", ascending=False)
print(summary)
summary.to_csv("hub_summary.csv", index=False)
summary.to_json("hub_summary.json", orient="records", indent=2)
