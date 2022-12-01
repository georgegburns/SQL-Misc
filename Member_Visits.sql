select MO.postcode as 'Full Postcode', MO.add1 as 'Address1', Sale.visitdatetime as 'Conversion Date'
from Sale WITH (NOLOCK)
left join branch WITH (NOLOCK) on sale.branchid=branch.idno    
left join saleline WITH (NOLOCK)on sale.idno=saleline.saleid 
left join MembersOffline MO WITH (NOLOCK) on saleline.PersonID = MO.PersonID   
left join VisitorThroughput vt WITH (NOLOCK) on saleline.idno=vt.saleLineID    
left join stockitem WITH (NOLOCK) on saleline.stockid=stockitem.idno    
left join product WITH (NOLOCK) on stockitem.prodid=product.idno    
left join Department d WITH (NOLOCK) on product.deptID=d.idno  
left join stockcategory WITH (NOLOCK) on product.catid=stockcategory.idno    
left join stockSubCategory sub WITH (NOLOCK) on product.catid=sub.catid and product.SubCatID=sub.idno 
where sub.name in ('Member')
AND Sale.visitdatetime >= '2022-07-01'
AND MO.memberNumber is not NULL
AND MO.postcode is not Null
AND MO.add1 is not Null
ORDER BY visitdatetime;