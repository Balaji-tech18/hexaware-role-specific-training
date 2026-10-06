SELECT * 
FROM insurance_claims ic
WHERE claim_amount = (
    SELECT MAX(claim_amount) 
    FROM insurance_claims 
    WHERE insurance_type = ic.insurance_type
);
