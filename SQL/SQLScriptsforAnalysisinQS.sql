-- ** SQL scripts for data analysis in Quicksight ** 

-- SQL script to combine loan data, pool option data, eligible pricing options and baseline data sets
SELECT
  ld.*
, pod.*
, b.selectedpoolid, "ecp"."pricepijk"
FROM
  ((eligible_pricing_combinations ecp
INNER JOIN pool_option_data pod ON (("ecp"."pooloptionj" = "pod"."pooloptionj") AND ("ecp"."servicerk" = "pod"."servicer")))
INNER JOIN loan_data ld ON ("ecp"."loanid" = "ld"."loanid"))
JOIN baseline b ON ld.loanid = b.loanid


-- SQL script to combine opt1_loan_data and opt1_loan_results_data

SELECT
  o1ld.*
, "o1lrd"."rank"
, "o1lrd"."price"
, "o1lrd"."valmethodid"
, "o1lrd"."valspecid"
, "o1lrd"."coupon"
, "o1lrd"."derivedsettleordinal"
FROM
  ("Opt1_loan_data" o1ld
INNER JOIN "Opt1_loan_results_data" o1lrd ON ("o1ld"."cid" = "o1lrd"."cid"))

-- SQL script to combine opt2_loan_data and opt2_loan_results_data

  SELECT
  o2ld.*
, "o2lrd"."rank"
, "o2lrd"."coupon"
, "o2lrd"."derivedsettleordinal"
, "o2lrd"."price"
, "o2lrd"."valmethodid"
, "o2lrd"."valspecid"
, "o2lrd"."agency"
, "o2lrd"."servicingretention"
, "o2lrd"."pooltype"
, "o2lrd"."poolbalancetype"
FROM
  ("Opt2_loan_data" o2ld
INNER JOIN "Opt2_loan_results_data" o2lrd ON ("o2ld"."cid" = "o2lrd"."cid"))

-- SQL script to combine opt3_loan_data and opt3_loan_results_data

  SELECT
  o3ld.*
, "o3lrd"."rank"
, "o3lrd"."coupon"
, "o3lrd"."derivedsettleordinal"
, "o3lrd"."price"
, "o3lrd"."valmethodid"
, "o3lrd"."valspecid"
, "o3lrd"."agency"
, "o3lrd"."servicer"
, "o3lrd"."servicingretention"
, "o3lrd"."pooltype"
, "o3lrd"."poolbalancetype"
FROM
  ("Opt3_loan_data" o3ld
INNER JOIN "Opt3_loan_results_data" o3lrd ON ("o3ld"."cid" = "o3lrd"."cid"))






