#!/bin/bash

account_number=$1
transaction_type=$2
amount=$3
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

echo "$timestamp | Account: $account_number | $transaction_type: $amount" >> transaction_log.txt
if [[ "$transaction_type" == "withdraw" && "$amount" -ge 50000 ]]; then
    echo "ALERT: High-value transaction detected! Withdrawal: ₹50000 or above."
fi