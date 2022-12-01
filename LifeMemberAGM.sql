SELECT CA.SERIALNUMBER AS 'Serial Number', MH.MEMBERSHIPID AS 'Member ID', 
CONCAT(FIRSTNAME,' ', KEYNAME) AS 'Full Name', CA.LETTERSALUTATION AS 'Letter Salutation', BANDNAME AS 'Membership', 
CA.ADDRESSLINE1 AS 'Address Line 1', CA.ADDRESSLINE2 AS 'Address Line 2', CA.ADDRESSLINE3 AS 'Address Line 3',
CA.ADDRESSLINE4 AS 'Address Line 4', CA.POSTCODE AS 'Postcode', CA.COUNTRY AS 'Country', CA.EMAILADDRESS AS 'Email Address',
CASE
	WHEN CA.DONOTMAIL = 0 OR CA.NEARESTCENTRE_BSK = 'Overseas'
	THEN 'Contactable'
	ELSE 'Not Contactable'
END AS 'Contact Status',
CASE 
	WHEN CA.DONOTEMAIL = 0 AND CA.EMAILADDRESS IS NOT NULL
	THEN 'Emailable'
	ELSE 'Not Emailable'
END AS 'Email Status',
CASE 
	WHEN CA.DONOTCONTACT = 0 AND CA.POSTCODE IS NOT NULL
	THEN 'Mailable'
	ELSE 'Not Mailable'
END AS 'Mail Status'
FROM CONTACT CA
INNER JOIN MEMBERSHIPHEADER MH ON MH.SERIALNUMBER = CA.SERIALNUMBER
INNER JOIN MEMBERSHIPDETAIL MD ON MD.MEMBERSHIPDETAILID = MH.MEMBERSHIPDETAILID
INNER JOIN MEMBERSHIPADMINBAND MAD ON MAD.BANDID = MD.BANDID
INNER JOIN MEMBERSHIPADMINPERIOD MAP ON MAD.PERIODID = MAP.PERIODID
INNER JOIN MEMBERSHIPADMIN MA ON MAP.TYPEID = MA.TYPEID
WHERE MEMBERSHIPTYPE LIKE '%Life%'
AND MEMBERSHIPSTATUS = 'Active'
GROUP BY CA.SERIALNUMBER, MH.MEMBERSHIPID, CONCAT(FIRSTNAME,' ', KEYNAME), CA.LETTERSALUTATION, CA.ADDRESSLINE1, CA.ADDRESSLINE2, CA.ADDRESSLINE3,
CA.ADDRESSLINE4, CA.COUNTRY, CA.POSTCODE, CA.EMAILADDRESS, CA.DONOTMAIL, CA.DONOTEMAIL, CA.DONOTCONTACT, CA.NEARESTCENTRE_BSK, BANDNAME;

SELECT CA.SERIALNUMBER AS 'Serial Number', PH.PLEDGEID AS 'Pledge ID', 
CONCAT(FIRSTNAME,' ', KEYNAME) AS 'Full Name', CA.LETTERSALUTATION AS 'Letter Salutation', 
CA.ADDRESSLINE1 AS 'Address Line 1', CA.ADDRESSLINE2 AS 'Address Line 2', CA.ADDRESSLINE3 AS 'Address Line 3',
CA.ADDRESSLINE4 AS 'Address Line 4', CA.POSTCODE AS 'Postcode', CA.COUNTRY AS 'Country', CA.EMAILADDRESS AS 'Email Address',
CASE
	WHEN CA.DONOTMAIL = 0 OR CA.NEARESTCENTRE_BSK = 'Overseas'
	THEN 'Contactable'
	ELSE 'Not Contactable'
END AS 'Contact Status',
CASE 
	WHEN CA.DONOTEMAIL = 0 AND CA.EMAILADDRESS IS NOT NULL
	THEN 'Emailable'
	ELSE 'Not Emailable'
END AS 'Email Status',
CASE 
	WHEN CA.DONOTCONTACT = 0 AND CA.POSTCODE IS NOT NULL
	THEN 'Mailable'
	ELSE 'Not Mailable'
END AS 'Mail Status'
FROM CONTACT CA
INNER JOIN MEMBERSHIPHEADER MH ON MH.SERIALNUMBER = CA.SERIALNUMBER
INNER JOIN PLEDGEHEADER PH ON PH.SERIALNUMBER = CA.SERIALNUMBER
INNER JOIN MEMBERSHIPDETAIL MD ON MD.MEMBERSHIPDETAILID = MH.MEMBERSHIPDETAILID
INNER JOIN MEMBERSHIPADMINBAND MAD ON MAD.BANDID = MD.BANDID
INNER JOIN MEMBERSHIPADMINPERIOD MAP ON MAD.PERIODID = MAP.PERIODID
INNER JOIN MEMBERSHIPADMIN MA ON MAP.TYPEID = MA.TYPEID
WHERE PH.SOURCECODE = 'APP00202'
AND PH.PLEDGESTATUS = 'Active'
GROUP BY CA.SERIALNUMBER, CONCAT(FIRSTNAME,' ', KEYNAME), CA.LETTERSALUTATION, CA.ADDRESSLINE1, CA.ADDRESSLINE2, CA.ADDRESSLINE3,
CA.ADDRESSLINE4, CA.COUNTRY, CA.POSTCODE, CA.EMAILADDRESS, CA.DONOTMAIL, CA.DONOTEMAIL, CA.DONOTCONTACT, CA.NEARESTCENTRE_BSK, PH.PLEDGEID;