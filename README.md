# 📊 FinTech Fraud Analysis (Python + MySQL)

## 📊 Project Summary

| Metric | Value |
|------|------|
| Dataset Size | 300,000 Transactions |
| Fraud Transactions | 2,265 |
| Tools Used | Python, MySQL |
| Queries Written | 15+ Analytical Queries |

## 📌 Project Overview

This project analyzes fraud patterns in digital payment transactions using **Python for data cleaning and preparation** and **MySQL for analytical fraud detection queries**.

The dataset contains **300,000 simulated digital payment transactions** including transaction details, device usage, merchant categories, and fraud labels.

The objective of this project is to perform **end-to-end data analysis** to:

- Clean and validate raw transaction data
- Identify fraud patterns across different transaction channels
- Detect high-risk segments across devices, locations, and merchant categories
- Measure fraud exposure through analytical SQL queries

This project demonstrates **core Data Analyst skills including data cleaning, SQL analytics, and fraud pattern analysis**.

---

# 📂 Dataset Description

The dataset represents digital payment transactions and contains the following attributes:

| Column | Description |
|------|------|
| transaction_id | Unique identifier for each transaction |
| user_id | Unique identifier for the user |
| transaction_date | Date of the transaction |
| amount | Transaction value |
| transaction_type | Payment method used |
| city | Location of transaction |
| device_type | Device used for transaction |
| merchant_category | Merchant business category |
| is_fraud | Fraud label (1 = fraud, 0 = legitimate) |

The dataset includes **300,000 transaction records** used for fraud analysis.

---

# 🛠 Tools and Technologies

### Python
- Pandas
- VS Code
- Jupyter Notebook

### Database
- MySQL Workbench

---

# ⚙️ Project Workflow

## 1️⃣ Data Preparation and Cleaning (Python)

The dataset was first analyzed and cleaned using Python.

Steps performed:

- Loaded dataset using **Pandas**
- Checked dataset structure using `df.info()`
- Identified missing values
- Handled null values in categorical attributes
- Validated numerical columns
- Removed duplicate records
- Verified data types
- Exported cleaned dataset for SQL analysis

### Data Quality Check

![Data Quality Check](images/data_quality_check.png)

---

# 🔎 Fraud Analysis Using SQL

After cleaning the dataset, it was imported into **MySQL** for fraud analytics.

Multiple SQL queries were written to analyze fraud patterns across different transaction dimensions.

---

## 📈 Overall Fraud Rate

This query calculates the percentage of fraudulent transactions in the dataset.

![Overall Fraud Rate](images/overall_fraud_rate.png)

---

## 💳 Fraud Rate by Transaction Type

Analyzing which transaction types show higher fraud exposure.

![Fraud by Transaction Type](images/fraud_by_transaction_type.png)

---

## 📱 Fraud Rate by Device Type

Device-based fraud analysis helps identify which devices are more frequently associated with fraudulent activity.

![Fraud by Device Type](images/fraud_by_device.png)

---

## 📅 Monthly Fraud Trend

Time-based fraud analysis to observe fraud patterns across different months.

![Monthly Fraud Trend](images/monthly_fraud_trend.png)

---

# 📊 Additional Analysis Performed

Beyond the examples shown above, additional analytical queries were performed to understand fraud behavior in greater depth:

### 1️⃣ Fraud Rate by Merchant Category
Analyzed fraud distribution across different merchant industries to identify which business categories experience higher fraud exposure.

### 2️⃣ Fraud Risk by Transaction Amount Segment
Transactions were segmented into **Low, Medium, and High value groups** to determine whether fraud is more common in specific transaction value ranges.

### 3️⃣ Monthly Fraud Trend Analysis
Time-based fraud analysis was performed to track fraud activity across months and identify temporal patterns in fraudulent transactions.

### 4️⃣ Users faced Multiple Fraud Attempts
Identified users who experienced **multiple fraudulent transactions**, helping detect potential repeat fraud targeting or compromised accounts.

### 5️⃣ City and Device Fraud Interaction
Performed a **multi-dimensional analysis combining city and device type** to detect high-risk combinations where fraud occurs more frequently.

### 6️⃣ Transaction Types with Above-Average Fraud Rate
Compared fraud rates across transaction types and identified those with **fraud rates higher than the overall system average**.

### 7️⃣ Fraud in First-Time Transactions
Analyzed whether fraud occurs during a user's **first transaction**, which may indicate risks associated with new accounts or onboarding fraud.

These analyses provide deeper insights into **behavioral patterns, high-risk segments, and structural vulnerabilities in digital payment systems**.
---

# 📌 Key Insights

Some key insights identified from the analysis:

- Fraud rates vary across **transaction types and payment channels**
  - 'Wallet' transaction types have highest fraud rate ie 3.33% 
- Certain **device types show higher fraud activity**
  - 'Web' among the highest with 2.49%
- Fraud patterns differ across **merchant categories**
- TOP 3 cities with highest fraud transaction
  - Chennai= 323 ,Delhi= 313 ,Bangalore=276

---

# 📁 Repository Structure

```
fintech-fraud-analysis
│
├── data
│   └── digital_payment_transactions.csv
│
├── python
│   └── cleaning_payment_data.ipynb
│
├── sql
│   └── fraud_analysis.sql
│
├── images
│   ├── data_quality_check.png
│   ├── overall_fraud_rate.png
│   ├── fraud_by_transaction_type.png
│   ├── fraud_by_device.png
│   └── monthly_fraud_trend.png
│
└── README.md
```

---

# 👨‍💻 Author
CHAITANYA SHARMA
Data Analyst Portfolio Project  
Fraud Detection Analysis using **Python and MySQL**
