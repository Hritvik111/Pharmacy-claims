# Pharmacy-claims
SQL Project

This repository contains the SQL scripts and database schema for a Pharmacy Database Management System. The system manages information about members, drugs, and prescriptions within a pharmacy setting.

## Database Structure

The database consists of three tables:

1. `dim_members`: Information about pharmacy members.
2. `dim_drugs`: Details about different drugs.
3. `fact_prescriptions`: Records of prescriptions, including member details, drug details, and prescription information.

## Setup Instructions

1. Create the database:

    ```sql
    CREATE DATABASE IF NOT EXISTS Pharmacy;
    USE Pharmacy;
    ```

2. Display the tables:

    ```sql
    SELECT * FROM dim_members;
    SELECT * FROM dim_drugs;
    SELECT * FROM fact_prescriptions;
    ```

3. Add primary and foreign keys:

    ```sql
    -- Commands to add primary and foreign keys
    ```

4. Query Examples:

    - Count of prescriptions for each drug:

        ```sql
        -- Query to count prescriptions for each drug
        ```

    - Count of prescriptions for a specific drug (e.g., Ambien):

        ```sql
        -- Query to count prescriptions for Ambien
        ```

    - Statistics based on member age:

        ```sql
        -- Query for statistics based on member age
        ```

    - Prescriptions for members over 65:

        ```sql
        -- Query for prescriptions for members over 65
        ```

    - Latest prescriptions for each member:

        ```sql
        -- Query for the latest prescriptions for each member
        ```

    - Latest prescription for a specific member (e.g., member_id = 10003):

        ```sql
        -- Query for the latest prescription for a specific member
        ```

Feel free to explore the SQL scripts and use them as a foundation for your pharmacy management system.

Happy coding!
