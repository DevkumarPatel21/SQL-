/** Q1. Create a query for daily distribution (Day of the week) of sum of TotalPrice on BillDate. Create the appropriate chart in Excel.**/
SELECT DATEPART(dw, ol.billdate) as dailydistribution,
 Sum(ol.totalprice) as TotalPrice FROM OrderLines ol
GROUP BY DATEPart(dw, ol.billdate)
ORDER BY DATEPart(dw, ol.billdate)

/** Q2. Create a query to show yearly distribution of number of subscribers by start date for each of the four channels 
     for the years 2004 and later. Your SQL query result should be in the following format. **/

SELECT YEAR(s.StartDate) as Year,
 SUM(CASE WHEN s.Channel = 'Chain' THEN 1 ELSE 0 END) as Chain,
 SUM(CASE WHEN s.Channel = 'Dealer' THEN 1 ELSE 0 END) as Dealer,
 SUM(CASE WHEN s.Channel = 'Mail' THEN 1 ELSE 0 END) as Male,
 SUM(CASE WHEN s.Channel = 'Store' THEN 1 ELSE 0 END) as Store
 FROM Subscribers s
 WHERE StartDate >= '2004-01-01' 
 GROUP BY YEAR(s.StartDate)
 ORDER BY YEAR(s.StartDate)

 /** Q3. Create a query to show yearly distribution of number of subscribers by stop date for each of the four channels. 
    Combine the result with result of Q2. in Excel and clean up data so that the final output looks like this.**/
	SELECT YEAR(s.StopDate) as Year,
 SUM(CASE WHEN s.Channel = 'Chain' THEN 1 ELSE 0 END) as Chain,
 SUM(CASE WHEN s.Channel = 'Dealer' THEN 1 ELSE 0 END) as Dealer,
 SUM(CASE WHEN s.Channel = 'Mail' THEN 1 ELSE 0 END) as Male,
 SUM(CASE WHEN s.Channel = 'Store' THEN 1 ELSE 0 END) as Store
 FROM Subscribers s
 WHERE StopDate >= '2004-01-01' 
 GROUP BY YEAR(s.StopDate)
 ORDER BY YEAR(s.StopDate)

 /**Q4. Create a query for the monthly rate plan to show number of subscribers in each plan. Make sure you only count the active subscribers. 
     Your SQL query results should be in the following format.**/
SELECT Month(s.StartDate) as Month,
 SUM(CASE WHEN s.RatePlan = 'Top' THEN 1 ELSE 0 END) as Topmost,
 SUM(CASE WHEN s.RatePlan = 'Middle' THEN 1 ELSE 0 END) as Middle,
 SUM(CASE WHEN s.RatePlan = 'Bottom' THEN 1 ELSE 0 END) as Bottom
 FROM Subscribers s
 WHERE s.IsActive = '1' and S.StartDate IS NOT NULL
 GROUP BY Month(s.StartDate)
 ORDER BY Month(s.StartDate)

/**Q5. Write a query to show the tenure (in terms of years) and total monthly fee 
for subscribers who have stopped subscription.**/
SELECT Year(S.StopDate) as Year, sum(S.Tenure) as tenure,
 Sum(S.MonthlyFee) as totalmonthlyfee FROM Subscribers S
 where S.IsActive = '0'
GROUP BY Year(S.StopDate)
ORDER BY Year(S.StopDate)
