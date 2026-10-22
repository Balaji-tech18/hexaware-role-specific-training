from pathlib import Path
import pandas as pd
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
INPUT = ROOT / "sample_data" / "orders_week2.csv"
OUTPUT = ROOT / "outputs"
OUTPUT.mkdir(parents=True, exist_ok=True)

df = pd.read_csv(INPUT)
for column in ["customer_name", "region", "city", "status"]:
    df[column] = df[column].fillna("Unknown").astype(str).str.strip()
df["issue_type"] = df["issue_type"].fillna("").astype(str).str.strip()
df["order_amount"] = pd.to_numeric(df["order_amount"], errors="coerce").fillna(0)
for column in ["order_date", "expected_delivery_date", "actual_delivery_date"]:
    df[column] = pd.to_datetime(df[column], errors="coerce")

today = pd.Timestamp.today().normalize()
late_delivered = df["actual_delivery_date"].notna() & (df["actual_delivery_date"] > df["expected_delivery_date"])
overdue_open = df["actual_delivery_date"].isna() & ~df["status"].isin(["Delivered", "Cancelled"]) & (df["expected_delivery_date"] < today)
df["delay_days"] = np.select([late_delivered, overdue_open], [(df["actual_delivery_date"] - df["expected_delivery_date"]).dt.days.fillna(0), (today - df["expected_delivery_date"]).dt.days.fillna(0)], default=0).astype(int)
df["is_delayed"] = np.where(df["delay_days"] > 0, 1, 0)
for column in ["order_date", "expected_delivery_date", "actual_delivery_date"]:
    df[column] = df[column].dt.strftime("%Y-%m-%d").fillna("")

df.to_csv(OUTPUT / "cleaned_orders.csv", index=False)
customer_summary = df.groupby(["customer_id", "customer_name"], as_index=False).agg(total_orders=("order_id", "count"), delayed_orders=("is_delayed", "sum"), total_order_value=("order_amount", "sum")).sort_values(["delayed_orders", "total_orders"], ascending=[False, False])
customer_summary.to_csv(OUTPUT / "delay_summary_by_customer.csv", index=False)
issues = df[df["issue_type"].ne("")].groupby("issue_type", as_index=False).agg(order_count=("order_id", "count"), delayed_orders=("is_delayed", "sum")).sort_values("order_count", ascending=False)
issues.to_csv(OUTPUT / "common_delivery_issues.csv", index=False)
summary = [f"Input records: {len(df)}", f"Delayed orders: {int(df['is_delayed'].sum())}", f"Customers represented: {df['customer_id'].nunique()}", f"Total order value: {df['order_amount'].sum():.2f}"]
(OUTPUT / "run_summary.txt").write_text("\n".join(summary) + "\n", encoding="utf-8")
print("\n".join(summary))
print(customer_summary.head(10).to_string(index=False))
