LOAD DATA LOCAL INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/digital_payment_transactions_clean.csv'
INTO TABLE digital_payment_transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- 1   Overall Fraud %
SELECT 
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_fraud_transactions,
    ROUND((SUM(is_fraud) / COUNT(*)) * 100, 2) AS fraud_percentage
FROM digital_payment_transactions;


-- 2   Fraud Rate by Transaction Type
SELECT 
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND((SUM(is_fraud)/COUNT(*)) * 100, 2) AS fraud_rate_percentage
FROM digital_payment_transactions
GROUP BY transaction_type
ORDER BY fraud_rate_percentage DESC;


-- 3   Fraud Rate by Device Type
SELECT 
    device_type,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND((SUM(is_fraud)/COUNT(*)) * 100, 2) AS fraud_rate_percentage
FROM digital_payment_transactions
GROUP BY device_type
ORDER BY fraud_rate_percentage DESC;


-- 4   fraud rate by merchant category
SELECT 
    merchant_category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND((SUM(is_fraud)/COUNT(*)) * 100, 2) AS fraud_rate_percentage
FROM digital_payment_transactions
GROUP BY merchant_category
ORDER BY fraud_rate_percentage DESC
LIMIT 10;


-- 5   High Amount Transactions vs Fraud
SELECT 
    CASE 
        WHEN amount < 1000 THEN 'Low Amount'
        WHEN amount BETWEEN 1000 AND 10000 THEN 'Medium Amount'
        ELSE 'High Amount'
    END AS amount_segment,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND((SUM(is_fraud)/COUNT(*)) * 100, 2) AS fraud_rate_percentage
FROM digital_payment_transactions
GROUP BY amount_segment
ORDER BY fraud_rate_percentage DESC;


-- 6   Monthly Fraud Trend
SELECT 
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND((SUM(is_fraud)/COUNT(*)) * 100, 2) AS fraud_rate_percentage
FROM digital_payment_transactions
GROUP BY YEAR(transaction_date), MONTH(transaction_date)
ORDER BY year, month;

-- 7   Users with Multiple Fraud Attempts
SELECT 
    user_id,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_attempts
FROM digital_payment_transactions
GROUP BY user_id
HAVING fraud_attempts > 1
ORDER BY fraud_attempts DESC
LIMIT 20;


-- 8   City + Device Fraud Interaction
SELECT 
    city,
    device_type,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND((SUM(is_fraud)/COUNT(*)) * 100, 2) AS fraud_rate_percentage
FROM digital_payment_transactions
GROUP BY city, device_type
ORDER BY fraud_rate_percentage DESC
LIMIT 20;


-- 9   Fraud Rate Above System Average
SELECT 
    transaction_type,
    ROUND((SUM(is_fraud)/COUNT(*)) * 100, 2) AS fraud_rate_percentage
FROM digital_payment_transactions
GROUP BY transaction_type
HAVING fraud_rate_percentage > (
    SELECT (SUM(is_fraud)/COUNT(*)) * 100
    FROM digital_payment_transactions
);


-- 10  Fraud on First Transaction (New User Risk)
WITH first_transaction AS (
    SELECT 
        user_id,
        MIN(transaction_date) AS first_txn_date
    FROM digital_payment_transactions
    GROUP BY user_id
)

SELECT 
    d.user_id,
    d.transaction_date,
    d.is_fraud
FROM digital_payment_transactions d
JOIN first_transaction f
ON d.user_id = f.user_id
AND d.transaction_date = f.first_txn_date
WHERE d.is_fraud = 1; 
