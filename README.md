# eCommerce store Database Project

## Overview

This project sets up the database schema for an eCommerce platform. The database includes tables for managing products, customers, orders, order details, departments, employees, projects, and assignments. The structure allows for efficient data management and supports key functionalities of an eCommerce system, including inventory tracking, customer information management, order processing, and employee project assignments.

## Project Structure

- `create_tables.sql`: Script to create the core database tables without constraints.
- `constraints_of_tables.sql`: Script to add constraints to the tables created in the first script.

## Groups and Responsibilities

- **Database Administrators**: 
  - Responsible for executing the scripts and maintaining the database integrity and performance.
- **Developers**: 
  - Responsible for creating, updating, and optimizing the SQL scripts to meet evolving business requirements.

## Additional Requirements

- Ensure you have the necessary database privileges to create tables and add constraints.
- Follow the proper order: first run `create_tables.sql` to set up the tables, then run `constraints_of_tables.sql` to apply the constraints.
- Verify the database setup after running the scripts to ensure all tables and constraints are correctly configured and operational.
- Regularly backup the database to prevent data loss and facilitate recovery in case of any issues.

By following these guidelines, you can establish a database foundation for your eCommerce platform, ensuring smooth and efficient operations.

