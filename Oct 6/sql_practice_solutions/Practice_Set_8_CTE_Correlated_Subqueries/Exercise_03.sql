WITH InsuranceTypeTotals AS (
    SELECT insurance_type, SUM(claim_amount) AS total_claim_amount
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT * 
FROM InsuranceTypeTotals 
WHERE total_claim_amount > 200000;
