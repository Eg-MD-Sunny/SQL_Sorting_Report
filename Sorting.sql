select w.id WarehouseID,
       w.name Warehouse,
	   pv.id [PVID],
	   pv.name [ProductName],
	   count(distinct t.ProductVariantId) NOofItems,
	   count(t.productvariantid) Quantity

from ThingTransaction tt
join ThingEvent te on te.ThingTransactionId=tt.id
join thing t on t.id=te.thingid
join PurchaseOrder po on po.id=t.PurchaseOrderId
join warehouse w on w.id=po.sourcingwarehouseid
join ProductVariant pv on pv.Id = t.ProductVariantId 

where tt.fromstate in (137438953472)
and tt.tostate in (4)
and tt.CreatedOn>='2022-01-01 00:00 +06:00'
and tt.CreatedOn<'2022-01-07 00:00 +06:00'
and pv.Id in (7601)

Group by w.id,w.Name,pv.id ,
	   pv.name  
order by 1 desc
