# FinTech Fraud Analysis (Python + MySQL)

## Project Overview

This project analyzes fraud patterns in digital payment transactions using Python for data preparation and MySQL for analytical queries.

The dataset contains **300,000 transaction records** including transaction details, user behavior, and fraud labels.

The goal is to identify **fraud patterns, high-risk segments, and behavioral signals associated with fraudulent transactions.**

---

## Dataset Features

- transaction_id
- user_id
- transaction_date
- amount
- transaction_type
- city
- device_type
- merchant_category
- is_fraud

---

## Tools Used

Python
- Pandas
- NumPy

Database
- MySQL
- MySQL Workbench

---

## Project Workflow

### 1. Data Cleaning (Python)

- Loaded dataset using Pandas
- Checked missing values
- Handled null values in city and device_type
- Removed duplicate records
- Validated data types
- Generated data quality summary

---

### 2. Fraud Analysis (SQL)

Fraud-focused SQL analysis included:

- Overall fraud rate
- Fraud rate by transaction type
- Fraud rate by device type
- Fraud rate by merchant category
- Fraud trends over time
- High-risk transaction amount segments
- Repeat fraud attempts by users
- Fraud exposure in monetary terms

---

## Key Insights

- Fraud rates vary significantly across transaction types.
- Certain device types show higher fraud occurrence.
- Fraud attempts often cluster among a small group of users.
- Fraud exposure can be evaluated both by count and transaction value.

---

## Repository Structure

