-- ** Create table scripts for Athena ** 

-- implemented an enhancement by Abc4567 developer upstream

-- fixed prod defect
-- SQL script to create table ‘baseline’:
CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.baseline (
  `LoanID` bigint,
  `Servicer` string,
  `selectedPoolID` string,
  `Price` float 
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/baseline/'
TBLPROPERTIES ('has_encrypted_data'='false')

-- added additional validation

-- SQL script to create table ‘eligible_pricing_combinations’:

CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.eligible_pricing_combinations (
  `LoanID` bigint,
  `PricePijk` float,
  `PoolOptionj` string,
  `Servicerk` string 
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/eligiblePricingCombinations/'
TBLPROPERTIES ('has_encrypted_data'='false');



-- SQL script to create table ‘loan_data’:

CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.loan_data (
  `LoanID` bigint,
  `Amount` float,
  `FICO` int,
  `DTI` float,
  `HighBalFlag` string,
  `PropOcc` string,
  `PropState` string,
  `PropType` string,
  `Purpose` string 
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/loanData/'
TBLPROPERTIES ('has_encrypted_data'='false');



-- SQL script to create table ‘pool_option_data’:

CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.pool_option_data (
  `poolOptionJ` string,
  `poolType` string,
  `poolBalanceType` string,
  `Agency` string,
  `Servicer` string 
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/poolOptionData/'
TBLPROPERTIES ('has_encrypted_data'='false');



-- SQL Script to create Opt1_loan_data: 
CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.Opt1_loan_data (
  `cID` string,
  `AmortTerm` int,
  `Amount` bigint,
  `cCode` string,
  `Channel` string,
  `DTI` int,
  `FICO` int,
  `HighBalFlag` string,
  `LockType` string,
  `LTV` float,
  `PropOcc` string,
  `PropState` string,
  `PropType` string,
  `PropUnits` int,
  `Purpose` string,
  `RefiType` string 
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/optimizationData1/loanData/'
TBLPROPERTIES ('has_encrypted_data'='false');



-- SQL Script to create Opt1_loan_results_data: 
CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.Opt1_loan_results_data (
  `cID` string,
  `Rank` int,
  `Price` float,
  `ValMethodID` string,
  `ValSpecID` string,
  `Coupon` float,
  `DerivedSettleOrdinal` bigint
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/optimizationData1/loanResultsData/'
TBLPROPERTIES ('has_encrypted_data'='false');



-- SQL Script to create Opt2_loan_data: 

CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.Opt2_loan_data (
  `AmortTerm` int,
  `Amount` float,
  `cCode` bigint,
  `Channel` string,
  `cID` bigint,
  `DTI` float,
  `FICO` int,
  `HighBalFlag` string,
  `LTV` float,
  `PropOcc` string,
  `PropState` string,
  `PropType` string,
  `PropUnits` int,
  `Purpose` string,
  `RefiType` string 
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/optimizationData2/loanData/'
TBLPROPERTIES ('has_encrypted_data'='false');



-- SQL Script to create Opt2_loan_results_data: 
CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.Opt2_loan_results_data (
  `cID` bigint,
  `Rank` int,
  `Coupon` float,
  `DerivedSettleOrdinal` bigint,
  `Price` float,
  `ValMethodID` string,
  `ValSpecID` string,
  `Agency` string,
  `servicingRetention` string,
  `poolType` string,
  `poolBalanceType` string
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/optimizationData2/loanResultsData/'
TBLPROPERTIES ('has_encrypted_data'='false');



-- SQL Script to create Opt3_loan_data: 
CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.Opt3_loan_data (
  `AmortTerm` int,
  `Amount` float,
  `cCode` bigint,
  `Channel` string,
  `cID` bigint,
  `DTI` float,
  `FICO` int,
  `HighBalFlag` string,
  `LTV` float,
  `PropOcc` string,
  `PropState` string,
  `PropType` string,
  `PropUnits` int,
  `Purpose` string,
  `RefiType` string 
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/optimizationData3/loanData/'
TBLPROPERTIES ('has_encrypted_data'='false');



-- SQL Script to create Opt3_loan_results_data: 
CREATE EXTERNAL TABLE IF NOT EXISTS mortgagepooling.Opt3_loan_results_data (
  `cID` bigint,
  `Rank` int,
  `Coupon` float,
  `DerivedSettleOrdinal` bigint,
  `Price` float,
  `ValMethodID` string,
  `ValSpecID` string,
  `Agency` string,
  `Servicer` string,
  `servicingRetention` string,
  `poolType` string,
  `poolBalanceType` string
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://mortgagepooling/optimizationData3/loanResultsData/'
TBLPROPERTIES ('has_encrypted_data'='false');






