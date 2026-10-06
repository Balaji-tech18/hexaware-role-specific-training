WITH AvgClaim AS (
    SELECT AVG(claim_amount) AS overall_avg 
    FROM insurance_claims
)
SELECT ic.* 
FROM insurance_claims ic, AvgClaim ac 
WHERE ic.claim_amount > ac.overall_avg;
