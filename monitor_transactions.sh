#Create a monitor_transactions.sh script that: Scans the transaction_log.txt. 
#Identifies any withdrawals of ₹50,000 or more and prints a summary of those transactions.

#Sample output: 
  # Suspicious Transactions:  2024-10-26 14:10:32 | Account: 67890 | Withdraw: 50000

#!/bin/bash

echo "Suspicious Transactions:"
grep "withdraw" transaction_log.txt | awk '{if ($8 >= 50000) print $0}'