select
	pe.PARTY_ID,
	pe.FIRST_NAME,
	pe.LAST_NAME,
	cm.INFO_STRING AS EMAIL,
	tn.CONTACT_NUMBER AS PHONE,
	pe.CREATEd_STAMP AS ENTRY_DATE 
from person pe 
	join party_role pr ON pe.PARTY_ID = pr.PARTY_ID 
	left join party_contact_mech pcm ON pcm.PARTY_ID = pe.PARTY_ID 
	left join contact_mech cm ON cm.CONTACT_MECH_ID = pcm.CONTACT_MECH_ID
	join telecom_number tn on tn.CONTACT_MECH_ID = cm.CONTACT_MECH_ID 
where cm.contact_mech_type_id = 'TELECOM_NUMBER' 
and pr.ROLE_TYPE_ID = 'CUSTOMER' 
and pe.CREATED_STAMP BETWEEN '2023-06-01' AND '2023-06-30';

/* we took all the fields we were asked to retrieve and then applied join on all the tables that were 
 * required like firstly joined partyRole table using party_id then applied left join on partyContactMech using partyId and
 * similarly retrieved the fields*/





