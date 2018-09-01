# Sales and Marketing Data Warehouse 

## Overview

### Name:  

Scooter's Big Wheels Marketing Database

### Description: 

This data set contains sales and marketing data for Scooter's Big Wheels Corporation. 
Full extracts are created nightly and are placed into two folders:

1. *raw* contains a full, uncompressed extract of each file.
2. *psvgz* contains the same data but gzip compressed with larger files split into four chunks. 
This folder also has manifest files for use with the Redshift copy command.

Fields in all files are pipe (|) delimited.
  
### Documentation: 

Summary specification in [FileLayoutInfo.pdf](FileLayoutInfo.pdf) with the
full specifications at 
[TPC BENCHMARK H Decision Support Standard Specification](http://www.tpc.org/TPC_Documents_Current_Versions/pdf/tpc-h_v2.17.3.pdf)

[sample-data.txt](sample-data.txt) contains the first 5 rows of every file. 
   
### Security Classification: Internal Use Only

### Contact: 
andersja@naionwide.com

### Update Frequency: Daily

### Tags:
- Sales data
- Marketing dat
- Transaction History

### Resources:

**Description:** Project data files
**ARN:** arn:aws:s3:::tpc-h-load-data
**Region:** us-east-2
**Type:** S3 Bucket
  
### Data At Work:
- **Title:** Redshift Challenge \
  **URL:** https://github.nwie.net/andersja/redshift-challenge/blob/master/README.md \
  **AuthorName:** Jeff Anderson \
  **AuthorURL:** https://jeff-anderson.com
