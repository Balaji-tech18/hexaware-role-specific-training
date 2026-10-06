WITH InsuranceTypeTotals AS (
    SELECT insurance_type, SUM(claim_amount) AS total_claim_amount
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT insurance_type, total_claim_amount,
       RANK() OVER (ORDER BY total_claim_amount DESC) AS claim_rank
FROM InsuranceTypeTotals;
