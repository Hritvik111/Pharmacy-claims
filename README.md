# Pharmacy-claims
SQL Project

This repository contains SQL scripts for creating and managing a pharmacy database. The database includes three tables: `dim_members`, `dim_drugs`, and `fact_prescriptions`. It also demonstrates the usage of primary and foreign keys for data integrity.

## Table of Contents
- [Database Schema](#database-schema)
- [Queries](#queries)
- [Usage](#usage)

## Database Schema

### dim_members
- `member_id` (Primary Key)
- `member_first_name`
- `member_last_name`
- `member_age`

### dim_drugs
- `drug_ndc` (Primary Key)
- `drug_name`
- `drug_description`

### fact_prescriptions
- `prescription_id` (Primary Key)
- `member_id` (Foreign Key referencing `dim_members`)
- `drug_ndc` (Foreign Key referencing `dim_drugs`)
- `fill_date`
- `copay`
- `insurance_paid`

## Queries

The following SQL queries are included in this repository:

1. Displaying tables: `dim_members`, `dim_drugs`, and `fact_prescriptions`.
2. Adding primary and foreign keys to the tables.
3. Retrieving the number of prescriptions for each drug.
4. Counting prescriptions for a specific drug ('Ambien').
5. Grouping prescriptions by age group and calculating related statistics.
6. Counting unique members and prescriptions for members over 65.
7. Selecting the latest prescription for each member and drug.
8. Selecting the latest prescription for a specific member (e.g., member_id = 10003).

## Usage

1. Clone the repository:

```bash
git clone https://github.com/Hritvik111/Pharmacy-claims.git
