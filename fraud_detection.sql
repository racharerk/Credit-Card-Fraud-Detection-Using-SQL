-- =========================
-- 1. Data Overview
-- =========================
SELECT COUNT(*) FROM transactions;

SELECT is_fraud, COUNT(*)
FROM transactions
GROUP BY is_fraud;


-- =========================
-- 2. Transaction Behavior
-- =========================
SELECT 
    is_fraud,
    AVG(amount),
    MAX(amount)
FROM transactions
GROUP BY is_fraud;


-- =========================
-- 3. Rule 1: Amount Anomaly
-- =========================
SELECT *
FROM (
    SELECT 
        *,
        AVG(amount) OVER (PARTITION BY customer_id) AS avg_spent
    FROM transactions
) t
WHERE amount > avg_spent * 3;


-- =========================
-- 4. Rule 2: Rapid Transactions
-- =========================
SELECT *
FROM (
    SELECT 
        *,
        TIMESTAMPDIFF(MINUTE, 
            LAG(transaction_date) OVER (PARTITION BY customer_id ORDER BY transaction_date),
            transaction_date
        ) AS diff_min
    FROM transactions
) t
WHERE diff_min < 1;


-- =========================
-- 5. Combined Rule Evaluation
-- =========================
SELECT 
    fraud_flag,
    is_fraud,
    COUNT(*) 
FROM (
    SELECT 
        *,
        CASE 
            WHEN amount > avg_spent * 3 THEN 1
            WHEN diff_min < 1 THEN 1
            ELSE 0
        END AS fraud_flag
    FROM (
        SELECT 
            *,
            AVG(amount) OVER (PARTITION BY customer_id) AS avg_spent,
            TIMESTAMPDIFF(MINUTE, 
                LAG(transaction_date) OVER (PARTITION BY customer_id ORDER BY transaction_date),
                transaction_date
            ) AS diff_min
        FROM transactions
    ) t
) t2
GROUP BY fraud_flag, is_fraud;