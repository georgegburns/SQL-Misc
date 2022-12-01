select sub.name,Sale.visitdatetime, branch.name, vty.Description, saleline.price_paid, product.publicDesc
from Sale
left join branch WITH (NOLOCK) on sale.branchid=branch.idno    
left join saleline WITH (NOLOCK)on sale.idno=saleline.saleid  
left join SaleDiscountLine sdl on sdl.saleLineID=saleline.idno 
left join Discount Dep on Dep.idno = sdl.discountID 
left join VisitorThroughput vt WITH (NOLOCK) on saleline.idno=vt.saleLineID 
left join VisitorType vty WITH (NOLOCK) on vt.visitorTypeID=vty.idno   
left join stockitem WITH (NOLOCK) on saleline.stockid=stockitem.idno    
left join product WITH (NOLOCK) on stockitem.prodid=product.idno 
left join Department d WITH (NOLOCK) on product.deptID=d.idno 
left join stockcategory WITH (NOLOCK) on product.catid=stockcategory.idno    
left join stockSubCategory sub WITH (NOLOCK) on product.catid=sub.catid and product.SubCatID=sub.idno  
where sub.name in ('Paying','Paying online', 'Non paying', 'Non paying online')
and Sale.visitdatetime >= '2021-11-01';