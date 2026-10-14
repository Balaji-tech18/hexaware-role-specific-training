use supply_chain_monitoring;

db.shipment_logs.find({ shipment_status: "Delayed" });
db.shipment_logs.find({ supplier_id: 203 }).sort({ shipped_at: -1 });
db.shipment_logs.getIndexes();
db.shipment_logs.countDocuments({});
