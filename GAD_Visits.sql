select AL.pcode, AL.houseNo,AL.add1,  GAD.dateEntered as 'Conversion Date', GAD.saleValue as 'Order Value'
from GiftAidDetails GAD
inner join AddressLines AL on AL.idno = GAD.addressLineID
where dateEntered >= '2022-07-01'
and Gad.saleValue > 0;