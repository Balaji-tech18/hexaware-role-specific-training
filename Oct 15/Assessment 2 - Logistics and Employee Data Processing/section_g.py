import numpy as np
import pandas as pd

shipments = pd.read_csv("shipments.csv")
shipments["cost_per_kg"] = shipments["cost"] / shipments["weight"]
shipments["cost_category"] = np.where(shipments["cost"] >= 1200, "Expensive", "Normal")
shipments["shipment_performance"] = np.select(
    [
        (shipments["status"] == "Delivered") & (shipments["cost"] >= 1200),
        (shipments["status"] == "Delivered"),
        (shipments["status"] == "In Transit"),
        (shipments["status"] == "Pending")
    ],
    ["Delivered - High Cost", "Delivered - Standard Cost", "In Progress", "Awaiting Dispatch"],
    default="Review"
)
shipments.to_csv("shipment_analysis.csv", index=False)
print(shipments)
