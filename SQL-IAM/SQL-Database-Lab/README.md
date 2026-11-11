# SQL Database Lab – Amazon RDS & MySQL

## Project Overview

This lab demonstrates the creation and management of a relational database using Amazon RDS and MySQL Workbench.

The project includes creating databases, designing tables, inserting records, retrieving data, and combining related tables using SQL JOIN statements.

## Technologies Used

- Amazon Web Services (AWS)
- Amazon RDS
- MySQL
- MySQL Workbench
- GitHub

## Database Structure

Created a database named `cloud_coffee` containing three tables:

### 1. coffee_table

Stores coffee product information.

- coffee_id
- coffee_name
- roast
- size
- price

### 2. customer_name

Stores customer information.

- customer_id
- first_name
- last_name

### 3. customer_order

Stores customer order information.

- customer_id
- orders
- coffee_id
- quantity

The tables use primary keys and foreign keys to establish relationships between customers, coffee products, and orders.

## SQL Operations Performed

- Created a MySQL database.
- Created three relational tables.
- Inserted sample records.
- Retrieved records using SELECT statements.
- Combined related tables using INNER JOIN operations.
- Used CHAR, VARCHAR, INT, and DECIMAL data types.

## SQL Data Types

| Data Type | Description |
|---|---|
| INT | Stores whole numbers. |
| VARCHAR(n) | Stores variable-length text up to n characters. |
| CHAR(n) | Stores fixed-length text. |
| DATE | Stores calendar dates. |
| TIME | Stores time values. |
| DATETIME | Stores date and time together. |
| BOOLEAN | Stores true or false values. |
| FLOAT | Stores approximate decimal numbers. |

## SQL vs. NoSQL

**SQL databases** use structured tables with predefined schemas and relationships. They are commonly used when data consistency and relational queries are important.

**NoSQL databases** use flexible data models such as documents, key-value pairs, or graphs. They are useful for applications requiring flexible schemas and scalable data storage.

## Amazon RDS vs. DynamoDB

**Amazon RDS**
- Managed relational database service.
- Supports database engines such as MySQL and PostgreSQL.
- Uses structured tables and SQL queries.
- Supports relationships between tables.

**Amazon DynamoDB**
- Fully managed NoSQL database service.
- Uses key-value and document data models.
- Designed for high performance and scalability.
- Does not require a fixed relational schema.

## Project Screenshots

Screenshots documenting database creation, table data, customer orders, and SQL JOIN results are included in the `Screenshots` folder.

## Project Files

- `SQL-queries.sql` – SQL commands used to create, populate, and query the database.
- `Screenshots/` – Screenshots documenting the lab exercises.

## What I Learned

This lab provided hands-on experience with relational database concepts, SQL commands, table relationships, and AWS managed database services.

I also gained practical experience connecting MySQL Workbench to an Amazon RDS MySQL instance and querying related data using JOIN statements.
