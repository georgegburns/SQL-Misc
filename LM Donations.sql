SELECT SERIALNUMBER AS 'Serial Numb34', SUM(PAYMENTAMOUNT) AS 'Sum of Donations', YEAR(DATEOFPAYMENT) AS 'Year'


FROM BATCHDETAIL BD

WHERE INCOMETYPE = 'DONATION' AND YEAR(DATEOFPAYMENT) > 2017
GROUP BY SERIALNUMBER, DATEOFPAYMENT;