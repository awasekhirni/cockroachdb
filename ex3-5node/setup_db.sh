#!/bin/bash
echo Wait for servers to be up
sleep 120

HOSTPARAMS="--host wahed --insecure"
SQL="/cockroach/cockroach.sh sql $HOSTPARAMS"

$SQL -e "CREATE DATABASE sycliqone;"
$SQL -d sycliqone -e "CREATE TABLE sycliqone.accounts (id INT PRIMARY KEY, balance DECIMAL);"
$SQL -d sycliqone -e "INSERT INTO sycliqone.accounts VALUES (1, 1000.50);"
$SQL -d sycliqone -e "SELECT * FROM sycliqone.accounts;"
