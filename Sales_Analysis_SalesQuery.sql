
SELECT 
  [ProductKey], 
  [CustomerKey],
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  --  ,[PromotionKey]
  --  ,[CurrencyKey]
  --  ,[SalesTerritoryKey]
  [SalesOrderNumber], 
  --  [SalesOrderLineNumber], 
  --  ,[RevisionNumber]
  --  ,[OrderQuantity], 
  --  ,[UnitPrice], 
  --  ,[ExtendedAmount]
  --  ,[UnitPriceDiscountPct]
  --  ,[DiscountAmount] 
  --  ,[ProductStandardCost]
  --  ,[TotalProductCost] 
  [SalesAmount], --  ,[TaxAmt]
  --  ,[Freight]
  --  ,[CarrierTrackingNumber] 
  --  ,[CustomerPONumber] 
  --  ,[OrderDate] 
  --  ,[DueDate] 
  --  ,[ShipDate] 
	  s.SalesTerritoryCountry as SalesCountry,
	  s.SalesTerritoryRegion as SalesRegion
FROM AdventureWorksDW2019.dbo.FactInternetSales as f
  Left Join AdventureWorksDW2019.dbo.DimCurrency as c on c.CurrencyKey = f.CurrencyKey
  Left Join AdventureWorksDW2019.dbo.DimSalesTerritory as s on s.SalesTerritoryKey = f.SalesTerritoryKey
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) -2 -- Ensures we always only bring two years of data from extraction.
ORDER BY
  OrderDateKey ASC
	  