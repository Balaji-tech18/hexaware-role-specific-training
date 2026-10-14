# Customer Order Insights & Delivery Tracker

## Week 1 objective
Create MySQL tables for customers, orders, and delivery status; perform CRUD; create a procedure to fetch delayed deliveries for a customer; store unstructured customer feedback in MongoDB and index it by customer ID.

## Deliverables
- `mysql/schema_and_sample_data.sql`
- `mysql/crud_and_procedures.sql`
- `mongodb/sample_documents_and_indexes.js`
- `mongodb/verification_queries.js`

## Business rules used in this sample
- An order has one customer.
- Each order has one current delivery-status row in this introductory design.
- `expected_delivery_date` is the promised date.
- A delivery is delayed if it is still undelivered after the expected date, or if it was delivered after the expected date.
