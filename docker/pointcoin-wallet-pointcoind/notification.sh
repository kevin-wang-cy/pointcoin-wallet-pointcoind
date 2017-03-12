#!/bin/sh
set -e

echo >> /var/log/pointcoin/notification.log
echo "`date -u` booking transaction: $1" >> /var/log/pointcoin/notification.log
/usr/bin/curl -i -X POST -H "Content-Type:application/json" -H "Accept:application/json" -d "{\"txid\":\"$1\"}" http://127.0.0.1:8080/api/mortgagewallets/transactions  >> /var/log/pointcoin/notification.log 2>&1
