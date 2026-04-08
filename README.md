##📊 Credit Card Fraud Detection using SQL

##📖 Overview
This project analyzes credit card transaction data to detect fraudulent activities using rule-based methods in SQL.

##📊 Dataset
- Source: Credit Card Transactions Dataset
  https://www.kaggle.com/datasets/priyamchoksi/credit-card-transactions-dataset?select=credit_card_transactions.csv
- Size used: Sample 50,000 transactions
- Includes customer ID, transaction, amount, location, and fraud label

##🔍 Key Analysis
   Fraud Distribution
- Fraud accounts for 0.9% of all transactions
- Highly imbalanced dataset

##💳 Transaction Behavior
- Fraudulent transactions have significantly higher values
- Average fraud transaction is ~8x larger than normal

##⚙️ Detection Rules
Rule 1: Amount Anomaly
- Flag transactions > 3x customer average
- Recall ≈ 46%
- Precision ≈ 9%

Rule 2: Rapid Transactions
- Flag transactions within short time intervals
- Minimal impact on fraud detection

Combined Rules
- Recall ≈ 47%
- Precision ≈ 9%

##💡 Key Insights
- Fraud is strongly associated with unusually high transaction amounts
- Transaction frequency is not a strong fraud indicator in this dataset
- Rule-based detection produces many false positives

##🚀 Business Recommendations
- Monitor high-value transactions in real-time
- Combine multiple behavioral signals
- Implement machine learning models for improved accuracy

##🛠️ Tools Used
- SQL (MySQL)
- Python (Pandas)

##📁 Project Structure
 ├── data/
 ├── sql/
 │    └── fraud_detection.sql
 ├── README.md
