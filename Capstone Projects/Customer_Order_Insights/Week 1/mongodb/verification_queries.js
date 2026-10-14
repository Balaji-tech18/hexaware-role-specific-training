use customer_order_insights;

db.customer_feedback.find({ customer_id: 1 }).sort({ feedback_date: -1 });
db.customer_feedback.find({ tags: "late_delivery" });
db.customer_feedback.getIndexes();
db.customer_feedback.countDocuments({});
