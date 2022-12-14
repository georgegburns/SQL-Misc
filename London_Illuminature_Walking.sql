SELECT NEARESTCENTRE_BSK AS 'Location', COUNT(NEARESTCENTRE_BSK) AS 'Count'
FROM CONTACT
WHERE NEARESTCENTRE_BSK = 'London'
GROUP BY NEARESTCENTRE_BSK
UNION
SELECT POSTCODE, COUNT(POSTCODE)
FROM CONTACT
WHERE POSTCODE LIKE 'SW6 4%'
OR POSTCODE LIKE 'SW6 5%'
OR POSTCODE LIKE 'SW6 6%'
OR POSTCODE LIKE 'SW6 7%'
OR POSTCODE LIKE 'SW13%'
OR POSTCODE LIKE 'SW15 1%'
OR POSTCODE LIKE 'W6 0%'
OR POSTCODE LIKE 'W6 7%'
OR POSTCODE LIKE 'W6 8%'
OR POSTCODE LIKE 'W6 9%'
GROUP BY POSTCODE;

SELECT NEARESTCENTRE_BSK AS 'Location', COUNT(NEARESTCENTRE_BSK) AS 'Count'
FROM CONTACT CA
WHERE NEARESTCENTRE_BSK = 'London'
AND EXISTS (SELECT 1
			FROM MEMBERSHIPHEADER MH
			WHERE MH.SERIALNUMBER = CA.SERIALNUMBER)
GROUP BY NEARESTCENTRE_BSK
UNION
SELECT POSTCODE, COUNT(POSTCODE)
FROM CONTACT CA
WHERE POSTCODE LIKE 'SW6 4%'
OR POSTCODE LIKE 'SW6 5%'
OR POSTCODE LIKE 'SW6 6%'
OR POSTCODE LIKE 'SW6 7%'
OR POSTCODE LIKE 'SW13%'
OR POSTCODE LIKE 'SW15 1%'
OR POSTCODE LIKE 'W6 0%'
OR POSTCODE LIKE 'W6 7%'
OR POSTCODE LIKE 'W6 8%'
OR POSTCODE LIKE 'W6 9%'
AND EXISTS (SELECT 1
			FROM MEMBERSHIPHEADER MH
			WHERE MH.SERIALNUMBER = CA.SERIALNUMBER)
GROUP BY POSTCODE;