Question-1
You have a table “Trans” having following data structure:
CustomerID INT, TransDate DATETIME, TransType CHAR (1), Amount MONEY
Trans Table has following data:

Write the following queries:
1.1. Display Trans Table records with following columns CustomerID, TransDate, WeekDay, TransType, Amount Where
TransType should display “Credit” for “C” and “Debit for “D” And WeekDay is TransDate of WeekDay, e.g. Today’s
Date is “Apr 17 2006” and Today WeekDay is “Monday”
Ans-   SELECT 
    CustomerID, 
    TransDate, 
    DATENAME(dw, TransDate) AS WeekDay,
    CASE 
        WHEN TransType = 'C' THEN 'Credit'
        WHEN TransType = 'D' THEN 'Debit'
    END AS TransType,
    Amount
FROM 
    Trans







2. Display Trans Table records with following columns CustomerID, TransDate, Credit Amount, Debit Amount, Where
Credit Amount is Amount When TransType = ‘C’ Where Debit Amount is Amount When TransType = ‘D’ Display Null
Value as “0.00” Display Amount with Two Decimal. Display TransDate with “MM/dd/yyyy” Format
Ans-  SELECT 
    CustomerID, 
    CONVERT(varchar, TransDate, 101) AS TransDate,
    ISNULL(CAST(SUM(CASE WHEN TransType = 'C' THEN Amount ELSE 0 END) AS decimal(10,2)), '0.00') AS [Credit Amount],
    ISNULL(CAST(SUM(CASE WHEN TransType = 'D' THEN Amount ELSE 0 END) AS decimal(10,2)), '0.00') AS [Debit Amount]
FROM 
    Trans
GROUP BY 
    CustomerID, 
    CONVERT(varchar, TransDate, 101)


3. Same as 2, but display the records where TransDate Month belongs to “4” month And Year = 2005.
Ans- SELECT 
    CustomerID, 
    CONVERT(varchar, TransDate, 101) AS TransDate,
    ISNULL(CAST(SUM(CASE WHEN TransType = 'C' THEN Amount ELSE 0 END) AS decimal(10,2)), '0.00') AS [Credit Amount],
    ISNULL(CAST(SUM(CASE WHEN TransType = 'D' THEN Amount ELSE 0 END) AS decimal(10,2)), '0.00') AS [Debit Amount]
FROM 
    Trans
WHERE 
    MONTH(TransDate) = 4 AND YEAR(TransDate) = 2005
GROUP BY 
    CustomerID, 
    CONVERT(varchar, TransDate, 101)

4. Same as 2, but display the records where TransDate is StartDate of the Month
Ans- SELECT 
    CustomerID, 
    CONVERT(varchar, DATEADD(day, -(DAY(TransDate)-1), TransDate), 101) AS TransDate,
    ISNULL(CAST(SUM(CASE WHEN TransType = 'C' THEN Amount ELSE 0 END) AS decimal(10,2)), '0.00') AS [Credit Amount],
    ISNULL(CAST(SUM(CASE WHEN TransType = 'D' THEN Amount ELSE 0 END) AS decimal(10,2)), '0.00') AS [Debit Amount]
FROM 
    Trans
GROUP BY 
    CustomerID, 
    DATEADD(day, -(DAY(TransDate)-1), TransDate)


5. Same as 2, but display the records where TransDate is EndDate of the Month
Ans-SELECT 
    CustomerID, 
    CONVERT(varchar, EOMONTH(TransDate), 101) AS TransDate,
    ISNULL(CAST(SUM(CASE WHEN TransType = 'C' THEN Amount ELSE 0 END) AS decimal(10,2)), '0.00') AS [Credit Amount],
    ISNULL(CAST(SUM(CASE WHEN TransType = 'D' THEN Amount ELSE 0 END) AS decimal(10,2)), '0.00') AS [Debit Amount]
FROM 
    Trans
GROUP BY 
    CustomerID, 
    EOMONTH(TransDate)



6. Display Trans Table records with following columns CustomerID, Year, Credit Total Amount, Debit Total Amount I
need Total for each CustomerID, Year Where Credit Total Amount and Debit Total Amount is Sum of Amount Null
Amount should display as 0.00.
Ans-SELECT 
    CustomerID, 
    YEAR(TransDate) AS [Year], 
    ISNULL(SUM(CASE WHEN TransType = 'C' THEN Amount ELSE 0 END), 0.00) AS [Credit Total Amount],
    ISNULL(SUM(CASE WHEN TransType = 'D' THEN Amount ELSE 0 END), 0.00) AS [Debit Total Amount]
FROM 
    Trans
GROUP BY 
    CustomerID, 
    YEAR(TransDate)



