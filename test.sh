#!/bin/bash

chmod +x transaction.sh monitor_transactions.sh create_account.sh

./transaction.sh 12345 deposit 5000
./transaction.sh 67890 withdraw 60000

# Check if transactions are logged correctly
if grep -q "Account: 12345 | deposit: 5000" transaction_log.txt && \
    grep -q "Account: 67890 | withdraw: 60000" transaction_log.txt && \
    ./transaction.sh 67890 withdraw 60000 | grep -q "ALERT: High-value transaction detected!"; then
    echo "Test 1 passed: 10 marks awarded"
    echo "10" >> score.txt
else
    echo "Test 1 failed: No marks awarded"
    echo "0" >> score.txt
fi

# Run the monitoring script and capture output
./monitor_transactions.sh > monitor_output.txt

# Check if the output includes the suspicious transaction
if grep -q "withdraw: 60000" monitor_output.txt; then
    echo "Test 2 passed: 10 marks awarded"
    echo "10" >> score.txt
else
    echo "Test 2 failed: No marks awarded"
    echo "0" >> score.txt
fi

./create_account.sh john_doe 99999

# Check if the account is created in accounts.txt with the correct default balance
if grep -q "Username: john_doe | Account: 99999 | Balance: 1000" accounts.txt; then
    echo "Test 3 passed: 10 marks awarded"
    echo "10" >> score.txt
else
    echo "Test 3 failed: No marks awarded"
    echo "0" >> score.txt
fi

# Verify that transaction_log.txt and accounts.txt are not empty after running tests
if [ -s transaction_log.txt ] && [ -s accounts.txt ]; then
    echo "Final Verification passed: 10 marks awarded"
    echo "10" >> score.txt
else
    echo "Final Verification failed: No marks awarded"
    echo "0" >> score.txt
fi
