CREATE DATABASE IF NOT EXISTS Pharmacy;
USE Pharmacy;

#displaying my 3 tables
select * from dim_members;
select * from dim_drugs;
select * from fact_prescriptions;

#adding primary and foreign keys
ALTER TABLE dim_members
ADD PRIMARY KEY (member_id);

ALTER TABLE dim_drugs
ADD PRIMARY KEY (drug_ndc);

ALTER TABLE fact_prescriptions
ADD PRIMARY KEY (prescription_id);

ALTER TABLE fact_prescriptions
ADD FOREIGN KEY (member_id) REFERENCES dim_members(member_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE fact_prescriptions
ADD FOREIGN KEY (drug_ndc) REFERENCES dim_drugs(drug_ndc) ON DELETE CASCADE ON UPDATE CASCADE;

#Q1
SELECT d.drug_name, COUNT(fp.prescription_id) AS num_prescriptions
FROM fact_prescriptions fp
JOIN dim_drugs d ON fp.drug_ndc = d.drug_ndc
GROUP BY d.drug_name;

SELECT COUNT(fp.prescription_id) AS num_prescriptions_ambien
FROM fact_prescriptions fp
JOIN dim_drugs d ON fp.drug_ndc = d.drug_ndc
WHERE d.drug_name = 'Ambien';

SELECT
    CASE
        WHEN dm.member_age >= 65 THEN 'age 65+'
        ELSE '< 65'
    END AS age_group,
    COUNT(DISTINCT fp.member_id) AS unique_members,
    COUNT(fp.prescription_id) AS total_prescriptions,
    SUM(fp.copay) AS total_copay,
    SUM(fp.insurance_paid) AS total_insurance_paid
FROM
    fact_prescriptions fp
JOIN
    dim_members dm ON fp.member_id = dm.member_id
GROUP BY
    age_group;

SELECT
    COUNT(DISTINCT dm.member_id) AS unique_members_over_65,
    COUNT(fp.prescription_id) AS total_prescriptions_over_65
FROM
    fact_prescriptions fp
JOIN
    dim_members dm ON fp.member_id = dm.member_id
WHERE
    dm.member_age >= 65;

WITH RankedPrescriptions AS (
    SELECT
        fp.member_id,
        m.member_first_name,
        m.member_last_name,
        d.drug_name,
        fp.fill_date,
        fp.insurance_paid,
        ROW_NUMBER() OVER (PARTITION BY fp.member_id, fp.drug_ndc ORDER BY fp.fill_date DESC) AS rn
    FROM
        fact_prescriptions fp
        JOIN dim_members m ON fp.member_id = m.member_id
        JOIN dim_drugs d ON fp.drug_ndc = d.drug_ndc
)
SELECT
    member_id,
    member_first_name,
    member_last_name,
    drug_name,
    fill_date,
    insurance_paid
FROM
    RankedPrescriptions
WHERE
    rn = 1;

SELECT
    m.member_id,
    m.member_first_name,
    m.member_last_name,
    d.drug_name,
    fp.fill_date,
    fp.insurance_paid
FROM
    fact_prescriptions fp
    JOIN dim_members m ON fp.member_id = m.member_id
    JOIN dim_drugs d ON fp.drug_ndc = d.drug_ndc
WHERE
    fp.member_id = 10003
ORDER BY
    fp.fill_date DESC
LIMIT 1;

