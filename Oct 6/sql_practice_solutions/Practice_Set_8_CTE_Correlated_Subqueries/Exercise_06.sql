WITH BranchTotals AS (
    SELECT branch, SUM(claim_amount) AS branch_total
    FROM insurance_claims
    GROUP BY branch
),
TypeTotals AS (
    SELECT insurance_type, SUM(claim_amount) AS type_total
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT b.branch, b.branch_total, t.insurance_type, t.type_total
FROM BranchTotals b
CROSS JOIN TypeTotals t;
