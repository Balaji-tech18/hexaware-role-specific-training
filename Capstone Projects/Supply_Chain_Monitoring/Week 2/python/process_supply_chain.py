from pathlib import Path
import pandas as pd
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
INPUT = ROOT / "sample_data" / "supply_chain_orders_week2.csv"
OUTPUT = ROOT / "outputs"
OUTPUT.mkdir(parents=True, exist_ok=True)

df = pd.read_csv(INPUT)
for column in ["supplier_name", "product_name", "sku", "order_status", "warehouse_location"]:
    df[column] = df[column].fillna("Unknown").astype(str).str.strip()
for column in ["quantity", "quantity_on_hand", "reorder_level", "reorder_quantity"]:
    df[column] = pd.to_numeric(df[column], errors="coerce").fillna(0)
for column in ["order_date", "expected_delivery_date", "actual_delivery_date"]:
    df[column] = pd.to_datetime(df[column], errors="coerce")

today = pd.Timestamp.today().normalize()
late_delivered = df["actual_delivery_date"].notna() & (df["actual_delivery_date"] > df["expected_delivery_date"])
overdue_open = df["actual_delivery_date"].isna() & ~df["order_status"].isin(["Delivered", "Cancelled"]) & (df["expected_delivery_date"] < today)
df["delay_days"] = np.select([late_delivered, overdue_open], [(df["actual_delivery_date"] - df["expected_delivery_date"]).dt.days.fillna(0), (today - df["expected_delivery_date"]).dt.days.fillna(0)], default=0).astype(int)
df["is_delayed"] = np.where(df["delay_days"] > 0, 1, 0)
df["is_low_stock"] = np.where(df["quantity_on_hand"] < df["reorder_level"], 1, 0)
for column in ["order_date", "expected_delivery_date", "actual_delivery_date"]:
    df[column] = df[column].dt.strftime("%Y-%m-%d").fillna("")

df.to_csv(OUTPUT / "cleaned_supply_chain.csv", index=False)
supplier_summary = df.groupby(["supplier_id", "supplier_name"], as_index=False).agg(total_orders=("order_id", "count"), delayed_orders=("is_delayed", "sum"), total_quantity=("quantity", "sum")).sort_values(["delayed_orders", "total_orders"], ascending=[False, False])
supplier_summary.to_csv(OUTPUT / "delays_by_supplier.csv", index=False)
low_stock = df[df["is_low_stock"] == 1][["supplier_id", "supplier_name", "product_name", "sku", "quantity_on_hand", "reorder_level", "reorder_quantity", "warehouse_location"]].drop_duplicates()
low_stock.to_csv(OUTPUT / "low_stock_items.csv", index=False)
summary = [f"Input records: {len(df)}", f"Delayed shipments: {int(df['is_delayed'].sum())}", f"Low-stock records: {int(df['is_low_stock'].sum())}", f"Suppliers represented: {df['supplier_id'].nunique()}"]
(OUTPUT / "run_summary.txt").write_text("\n".join(summary) + "\n", encoding="utf-8")
print("\n".join(summary))
print(supplier_summary.to_string(index=False))
