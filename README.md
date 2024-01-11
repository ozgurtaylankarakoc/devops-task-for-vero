Hello Dear Vero Developer Team!

The way of the solution was slightly challanging. while on the way i bumped several errors, i would like to mention about sequentially.

# Errors

## 1. SQLSTATE[08001]: [Microsoft][ODBC Driver 18 for SQL Server]SSL Provider: [error:0A000086:SSL routines::certificate verify failed:self-signed certificate] 
- when this error occurred, i researched why it could be ,then found the reason is QuickDbTest.php file needs "trust_server_sertificate = true" state on connection process via odbc driver on "dsn" command line.

## before 
QuickDbTest.php
```bash
$dsn = "sqlsrv:server=".self::host.";Database=".self::db;
```
## after
```bash
$dsn = "sqlsrv:server=".self::host.";Database=".self::db.";TrustServerCertificate=true";
```
source: https://stackoverflow.com/questions/71688125/odbc-driver-18-for-sql-serverssl-provider-error1416f086

## 2. SQLSTATE[HYT00]: [Microsoft][ODBC Driver 18 for SQL Server]Login timeout expired.
- This issue occurrs when you re not launching Mssql and API app on different IP's so app ve to be on the same host with MsSQL therefore i changed containers network type bridge to HOST as visible on docker-compose.yml


