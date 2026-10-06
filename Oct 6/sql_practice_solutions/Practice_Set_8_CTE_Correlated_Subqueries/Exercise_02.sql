WITH BranchTotals AS (
    SELECT branch, SUM(claim_amount) AS total_claim_amount
    FROM insurance_claims
    GROUP BY branch
)
SELECT * FROM BranchTotals;
