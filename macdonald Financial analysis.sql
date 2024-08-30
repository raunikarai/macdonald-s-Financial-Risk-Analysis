create database Finance;
use finance;
CREATE TABLE McDonaldsFinancials (
  Year INT,
  Market_ca DECIMAL(10,2),
  Normalise_Revenue DECIMAL(10,2),
  Normalize_Earnings DECIMAL(10,2),
  Normalise_P_E_ratio DECIMAL(10,2),
  P_S_ratio DECIMAL(10,2),
  P_B_ratio DECIMAL(10,2),
  Operating_EPS DECIMAL(10,2),
  Shares_Out DECIMAL(10,2),
  Cash_on_Ha DECIMAL(10,2),
  Dividend_Y DECIMAL(10,2),
  Dividend_s DECIMAL(10,2),
  Net_assets DECIMAL(10,2),
  Total_asse DECIMAL(10,2),
  Normalise_Total_debt DECIMAL(10,2),
  Normalise_Total_liabilities DECIMAL(10,2),
  Normalise_debt DECIMAL(10,2)
);
LOAD DATA INFILE 'C:/McDonalds_Financial_Statements.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SELECT Year, AVG(Normalize_Earnings) as Average_Earnings, AVG(Normalise_P_E_ratio) as Average_P_E_ratio
FROM McDonaldsFinancials
WHERE Year BETWEEN 2018 AND 2022
GROUP BY Year;

-- Select the year and the maximum P/E ratio
SELECT Year, MAX(Normalise_P_E_ratio) as Max_P_E_ratio
FROM McDonaldsFinancials
GROUP BY Year;

-- Select the year with the highest revenue
SELECT Year, MAX(Normalise_Revenue) as Max_Revenue
FROM McDonaldsFinancials;

-- Select the year with the lowest cash on hand
SELECT Year, MIN(Cash_on_Ha) as Min_Cash_on_Hand
FROM McDonaldsFinancials;

-- Find the year with the highest growth in earnings
SELECT Year, (Normalize_Earnings - LAG(Normalize_Earnings, 1, 0) OVER (ORDER BY Year)) as Earnings_Growth
FROM McDonaldsFinancials
ORDER BY Earnings_Growth DESC
LIMIT 1;

-- Select the year, market capitalization, revenue, and earnings per share
-- for companies with a P/E ratio greater than 20
SELECT
    Year,
    Market_ca,
    Revenue,
    EPS
FROM
    McDonalds_Financial_Statements
WHERE
    `P/E ratio` > 20;




 


