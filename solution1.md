Question:

How many new customers signed up during the marketing campaign in June 2023?

Solution:

```
SELECT
    pe.PARTY_ID,
    pe.FIRST_NAME,
    pe.LAST_NAME,
    cm.INFO_STRING AS EMAIL,
    tn.CONTACT_NUMBER AS PHONE,
    pe.CREATED_STAMP AS ENTRY_DATE
FROM person pe 
    JOIN party_role pr ON pe.PARTY_ID = pr.PARTY_ID
    JOIN party_contact_mech pcm ON pcm.PARTY_ID = pe.PARTY_ID 
    JOIN contact_mech cm ON cm.CONTACT_MECH_ID = pcm.CONTACT_MECH_ID
    LEFT JOIN telecom_number tn ON tn.CONTACT_MECH_ID = cm.CONTACT_MECH_ID 
WHERE cm.contact_mech_type_id = 'TELECOM_NUMBER' 
AND pr.ROLE_TYPE_ID = 'CUSTOMER' 
AND pe.CREATED_STAMP BETWEEN '2023-06-01' AND '2023-06-30';
```

Reasoning:

We selected all required fields and applied the necessary joins:

1. Joined 'party_role' to filter customers.

2. Used left joins on 'party_contact_mech' and 'contact_mech' to get email details.

3. Joined 'telecom_number' to retrieve phone numbers.

4. Filtered data within the given date range to capture new customers acquired in June 2023.


Query Cost: 16010.35
