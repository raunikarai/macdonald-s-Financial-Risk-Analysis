create database Finance;
use finance;
create table Macdonald (
Year_of_company float,
Market_cap float,
Revenue float
);
select * from macdonald;
Alter table macdonald add (
earnings float,
PE_ratio float,
PS_ratio float,
Operating_margin float,
ESP float,
Shares_Outstanding float,
Cash_on_hand float,
Dividend_yeild float,
Dividend float,
Net_asset float,
total_assest float,
total_debt float,
total_liabilities float
);
alter table macdonald modify column year_of_company int;
alter table macdonald add column PB_ratio int after PS_ratio;
LOAD DATA INFILE 'C:/McDonalds_Financial_Statements.csv'
INTO TABLE macdonald
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SELECT * 
FROM macdonald
WHERE TOTAL_ASSEST = (
    SELECT MAX(TOTAL_ASSEST) 
    FROM macdonald
);
select year_of_company, revenue, earnings, total_debt, total_assest,total_liabilities from macdonald;


select @@secure_file_priv;
SELECT 
    year_of_company, 
    SUM(total_assest) / SUM(total_liabilities) AS current_ratio
FROM 
    macdonald
GROUP BY 
    year_of_company;





 


