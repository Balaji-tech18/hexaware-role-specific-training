# Supply Chain Monitoring and Optimization Platform

## Week 1 objective
Create MySQL tables for suppliers, orders, and inventory; demonstrate CRUD; create a stored procedure that creates reorder requests for low-stock items; store shipment logs in MongoDB and index them for efficient queries.

## Deliverables
- `mysql/01_schema_and_sample_data.sql`
- `mysql/02_crud_and_procedures.sql`
- `mongodb/01_sample_documents_and_indexes.js`
- `mongodb/02_verification_queries.js`

## Business rules used in this sample
- `reorder_level` is the threshold below which inventory should be reordered.
- `reorder_quantity` is the suggested replenishment amount.
- The procedure inserts a reorder request only when stock is below the threshold and an open request does not already exist for that inventory item.
