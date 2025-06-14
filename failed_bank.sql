Create database fail_banks; -- creation of the database to store the info

-- Utilised the import flat file feature in SQL to get the data 

CREATE TABLE BankFailures (
    failure_id INT PRIMARY KEY IDENTITY(1,1),
    bank_name VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    cert INT UNIQUE,
    closing_date DATE,
    fund DECIMAL(15,2),
    acquiring_institution VARCHAR(255)
); -- Creation of this table to allow for data processing using the failure ID through auto increment

INSERT INTO fail_banks.dbo.BankFailures (bank_name, city, state, cert, closing_date, fund, acquiring_institution)
SELECT bank_name, city, state, cert, closing_date, fund, acquiring_institution
FROM fail_banks.dbo.download_data; -- this query was used to move the data from the csv file into the newly created table 

SELECT * from BankFailures; -- simple SELECT query to confirm data was imported

SELECT country_state, COUNT(*) AS total_failures
FROM fail_banks.dbo.BankFailures
GROUP BY country_state; -- this query shows the total number of failed banks per each state. 

Select YEAR (closing_date) AS failure_year, COUNT(*) AS total_failures
from fail_banks.dbo.BankFailures
Group by closing_date
Order by closing_date ASC; -- this query runs time series analysis for based on the total number of failures per each year. 

Select country_state, Avg(Fund) AS Avg_fund
from fail_banks.dbo.Bankfailures
Group by country_state
Order by country_state DESC -- this query identifies the avg of the funds alloctaed per each state
;

Select acquiring_institution, COUNT (*) AS Acquired_banks
from fail_banks.dbo.BankFailures
Group by acquiring_institution
Order by Acquired_banks DESC -- this quesry quantifies the total number of failed banks have been acquired by an institution
;

Select bank_name, country_state, fund 
from fail_banks.dbo.Bankfailures
Where fund > (Select AVG(fund) from fail_banks.dbo.Bankfailures)
Order by fund;  -- this query pulls the name as well as state of the bank and identifies the banks that had a high fund allocation











