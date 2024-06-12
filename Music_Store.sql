**Above Average Customers - Orders**
WITH OverallAverage AS
  (SELECT ROUND(AVG(total), 2) AS OverallOrderAvg
   FROM Invoice),
     CustomerAverage AS
  (SELECT cu.FirstName,
          cu.LastName,
          SUM(i.total) TotalOrderAmt,
          ROUND(AVG(i.total), 2) CustOrderAvg
   FROM Invoice i
   JOIN Customer cu ON i.CustomerId = cu.CustomerId
   GROUP BY cu.LastName)
SELECT c.LastName,
       c.TotalOrderAmt,
       c.CustOrderAvg,
       o.OverallOrderAvg
FROM OverallAverage o,
     CustomerAverage c
WHERE CustOrderAvg>OverallOrderAvg
ORDER BY c.CustOrderAvg DESC

**Above Average Customers - Spent Per Unit** 
WITH OverallAverage AS
  (SELECT ROUND(AVG(UnitPrice), 2) AS OverallUnitAvg
   FROM InvoiceLine),
     CustomerAverage AS
  (SELECT g.Name,
          cu.FirstName,
          cu.LastName,
          SUM(il.UnitPrice) TotalCustUnitAmt,
          ROUND(AVG(il.UnitPrice), 2) CustUnitAvg
   FROM Invoice i
   JOIN Customer cu ON i.CustomerId = cu.CustomerId
   JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
   JOIN Track t ON il.TrackId = t.TrackId
   JOIN Album al ON t.AlbumId = al.AlbumId
   JOIN Genre g ON t.GenreId = g.GenreId
   GROUP BY cu.LastName)
SELECT c.LastName,
       c.TotalCustUnitAmt,
       c.CustUnitAvg,
       o.OverallUnitavg
FROM OverallAverage o,
     CustomerAverage c
WHERE CustUnitAvg>OverallUnitAvg
ORDER BY c.CustUnitAvg DESC

**Above Average Customers - Genre Distribution**
WITH OverallAverage AS
  (SELECT ROUND(AVG(UnitPrice), 2) AS OverallAvg
   FROM InvoiceLine),
     CustomerAverage AS
  (SELECT g.Name,
          cu.FirstName,
          cu.LastName,
          SUM(il.UnitPrice) TotalUnitAmt,
          ROUND(AVG(il.UnitPrice), 2) CustAvg
   FROM Invoice i
   JOIN Customer cu ON i.CustomerId = cu.CustomerId
   JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
   JOIN Track t ON il.TrackId = t.TrackId
   JOIN Album al ON t.AlbumId = al.AlbumId
   JOIN Genre g ON t.GenreId = g.GenreId
   GROUP BY cu.LastName,
            g.Name)
SELECT c.Name,
       COUNT(c.LastName) Customers,
       SUM(c.TotalUnitAmt) UnitTotal,
       ROUND(AVG(c.TotalUnitAmt), 2) AvgUnitTotal
FROM OverallAverage o,
     CustomerAverage c
WHERE CustAvg>OverallAvg
GROUP BY c.Name
ORDER BY c.custavg DESC

**Above Average Customers - Sales Contribution per Country**
WITH OverallAverage AS
  (SELECT ROUND(AVG(total), 2) AS OverallAvg
   FROM Invoice),
     CustomerAverage AS
  (SELECT i.BillingCountry Country,
          cu.FirstName,
          cu.LastName,
          SUM(i.total) TotalOrderAmt,
          ROUND(AVG(i.total), 2) CustAvg
   FROM Invoice i
   JOIN Customer cu ON i.CustomerId = cu.CustomerId
   GROUP BY cu.LastName),
     AverageFilter AS
  (SELECT ca.LastName LastName,
          ca.Country,
          ca.TotalOrderAmt
   FROM OverallAverage o,
        CustomerAverage ca
   WHERE CustAvg > OverallAvg
   GROUP BY LastName
   ORDER BY ca.custavg DESC),
     TotalCountrySales AS
  (SELECT i.BillingCountry Country,
          SUM(i.total) CountrySales
   FROM Invoice i
   GROUP BY i.BillingCountry),
     AboveAvgCustCountrySales AS
  (SELECT af.Country,
          SUM(af.TotalOrderAmt) AboveAvgCustSales
   FROM AverageFilter af
   GROUP BY af.Country)
SELECT tcs.Country,
       aaccs.AboveAvgCustSales,
       tcs.CountrySales,
       ROUND((aaccs.AboveAvgCustSales / tcs.CountrySales)*100, 2) AboveAvgSalesPercent
FROM AboveAvgCustCountrySales aaccs
LEFT JOIN TotalCountrySales tcs ON tcs.Country = aaccs.Country
ORDER BY tcs.Country
