
use supply_chain_monitoring;

db.shipment_logs.drop();

db.shipment_logs.insertMany([
  {
    shipment_id: "SH3001",
    order_id: 2001,
    supplier_id: 201,
    carrier: "FastTrack Logistics",
    origin: "Chennai",
    destination: "Coimbatore",
    shipped_at: ISODate("2026-09-21T05:30:00Z"),
    delivered_at: ISODate("2026-09-24T10:00:00Z"),
    shipment_status: "Delivered",
    events: [
      { status: "Picked Up", event_time: ISODate("2026-09-21T05:30:00Z") },
      { status: "Delivered", event_time: ISODate("2026-09-24T10:00:00Z") }
    ]
  },
  {
    shipment_id: "SH3002",
    order_id: 2002,
    supplier_id: 202,
    carrier: "National Cargo",
    origin: "Mumbai",
    destination: "Chennai",
    shipped_at: ISODate("2026-09-23T08:00:00Z"),
    delivered_at: null,
    shipment_status: "Delayed",
    delay_reason: "Vehicle breakdown",
    events: [
      { status: "Picked Up", event_time: ISODate("2026-09-23T08:00:00Z") },
      { status: "Delay Reported", event_time: ISODate("2026-09-28T11:00:00Z") }
    ]
  },
  {
    shipment_id: "SH3003",
    order_id: 2003,
    supplier_id: 203,
    carrier: "CityLink Freight",
    origin: "Bengaluru",
    destination: "Hyderabad",
    shipped_at: ISODate("2026-10-02T06:45:00Z"),
    delivered_at: null,
    shipment_status: "In Transit",
    events: [
      { status: "Picked Up", event_time: ISODate("2026-10-02T06:45:00Z") },
      { status: "Arrived at Hub", event_time: ISODate("2026-10-04T15:20:00Z") }
    ]
  },
  {
    shipment_id: "SH3004",
    order_id: 2004,
    supplier_id: 204,
    carrier: "FastTrack Logistics",
    origin: "Hyderabad",
    destination: "Pune",
    shipped_at: ISODate("2026-10-03T09:15:00Z"),
    delivered_at: ISODate("2026-10-11T12:10:00Z"),
    shipment_status: "Delivered Late",
    delay_reason: "Sorting backlog",
    events: [
      { status: "Picked Up", event_time: ISODate("2026-10-03T09:15:00Z") },
      { status: "Delivered", event_time: ISODate("2026-10-11T12:10:00Z") }
    ]
  },
  {
    shipment_id: "SH3005",
    order_id: 2006,
    supplier_id: 203,
    carrier: "SouthLine Transport",
    origin: "Bengaluru",
    destination: "Chennai",
    shipped_at: ISODate("2026-10-07T07:00:00Z"),
    delivered_at: null,
    shipment_status: "Delayed",
    delay_reason: "Supplier dispatch backlog",
    events: [
      { status: "Picked Up", event_time: ISODate("2026-10-07T07:00:00Z") },
      { status: "Delay Reported", event_time: ISODate("2026-10-10T13:30:00Z") }
    ]
  }
]);

// Indexes for frequent queries.
db.shipment_logs.createIndex({ order_id: 1 });
db.shipment_logs.createIndex({ supplier_id: 1, shipment_status: 1 });
db.shipment_logs.createIndex({ shipped_at: -1 });
