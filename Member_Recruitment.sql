SELECT DISTINCT(MH.MEMBERSHIPID), CA.ADDRESSLINE1, CA.POSTCODE, MH.FIRSTJOINED AS 'Conversion Date'
FROM MEMBERSHIPHEADER MH
INNER JOIN CONTACT CA ON CA.SERIALNUMBER = MH.SERIALNUMBER
INNER JOIN BATCHDETAIL BD ON BD.SOURCECODE = MH.SOURCECODE
INNER JOIN MEMBERSHIPDETAIL MD ON MD.MEMBERSHIPID = MH.MEMBERSHIPID
INNER JOIN MEMBERSHIPADMINBAND MAD ON MAD.BANDID = MD.BANDID
INNER JOIN MEMBERSHIPADMINPERIOD MAP ON MAD.PERIODID = MAP.PERIODID
INNER JOIN MEMBERSHIPADMIN MA ON MAP.TYPEID = MA.TYPEID
WHERE MH.FIRSTJOINED >= '2022-07-01'
AND BD.PAYMENTAMOUNT > 0
AND MA.MEMBERSHIPTYPE IN ('Membership', 'Historic Membership', 'Honorary Membership', 'Life')
AND BD.INCOMETYPE = 'MEMBERSHIP'
AND BD.REVERSAL NOT IN (1, -1)
ORDER BY MH.FIRSTJOINED;