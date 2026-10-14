use customer_order_insights;

db.customer_feedback.drop();

db.customer_feedback.insertMany([
  {
    feedback_id: "FB1001",
    customer_id: 1,
    order_id: 1001,
    rating: 2,
    feedback_text: "The headphones arrived later than promised.",
    channel: "email",
    feedback_date: ISODate("2026-09-29T10:15:00Z"),
    tags: ["late_delivery", "courier"]
  },
  {
    feedback_id: "FB1002",
    customer_id: 2,
    order_id: 1003,
    rating: 5,
    feedback_text: "Quick delivery and good packaging.",
    channel: "website",
    feedback_date: ISODate("2026-09-28T08:00:00Z"),
    tags: ["on_time", "packaging"]
  },
  {
    feedback_id: "FB1003",
    customer_id: 1,
    order_id: 1002,
    rating: 3,
    feedback_text: "Tracking did not update for two days.",
    channel: "mobile_app",
    feedback_date: ISODate("2026-10-09T12:30:00Z"),
    tags: ["tracking", "communication"]
  },
  {
    feedback_id: "FB1004",
    customer_id: 3,
    order_id: 1004,
    rating: 2,
    feedback_text: "The monitor shipment is stuck at a sorting facility.",
    channel: "phone",
    feedback_date: ISODate("2026-10-08T14:45:00Z"),
    tags: ["late_delivery", "warehouse"]
  },
  {
    feedback_id: "FB1005",
    customer_id: 5,
    order_id: 1006,
    rating: 4,
    feedback_text: "Product looks good; waiting for delivery.",
    channel: "website",
    feedback_date: ISODate("2026-10-10T09:20:00Z"),
    tags: ["pending"]
  }
]);

// Required index: search feedback by customer ID.
db.customer_feedback.createIndex({ customer_id: 1 });

// Useful additional indexes.
db.customer_feedback.createIndex({ order_id: 1 });
db.customer_feedback.createIndex({ feedback_date: -1 });
