# Redshift Challenge

## Prerequisites

If you have admin rights on your computer, download the latest version of DBeaver

## References

* [Amazon Redshift Best Practices](https://docs.aws.amazon.com/redshift/latest/dg/best-practices.html)

## The Challenge
Over the summer, your department intern, Johnny, created and loaded some tables in Redshift for the Marketing department. 
Initially, the custer was performing well but as more data was added, performance started to degrade. Now, the AVP of 
Marketing is concerned because query performance is slow, the table load times are longer than anticipated, and storage 
usage is much higher than projected for the amount of data being stored.  

There is a bit of wiggle room in the budget to add more resources to the cluster but, before doing so, your manager has
asked you to review Johnny's work and make sure it follows the 
[AWS Redshift best practices](https://docs.aws.amazon.com/redshift/latest/dg/best-practices.html). 
Having just earned your 
[AWS Big Data Speciality Certification](https://aws.amazon.com/certification/certified-big-data-specialty/) 
you are eager to impress her.

## The Intern's Design

1. The table create statements Johnny used are shown below:
    ```sql
    CREATE TABLE region
    (
    	R_REGIONKEY BIGINT ENCODE RAW,
    	R_NAME CHAR(256) ENCODE RAW,
    	R_COMMENT VARCHAR(256) ENCODE RAW
    );
    
    CREATE TABLE nation
    (
    	N_NATIONKEY BIGINT ENCODE RAW,
    	N_NAME CHAR(256) ENCODE RAW,
    	N_REGIONKEY BIGINT ENCODE RAW,
    	N_COMMENT VARCHAR(256) ENCODE RAW
    );
    
    CREATE TABLE part
    (
    	P_PARTKEY BIGINT ENCODE RAW,
    	P_NAME CHAR(256) ENCODE RAW,
    	P_MFGR CHAR(256) ENCODE RAW,
    	P_BRAND CHAR(256) ENCODE RAW,
    	P_TYPE CHAR(256) ENCODE RAW,
    	P_SIZE INTEGER ENCODE RAW,
    	P_CONTAINER CHAR(256) ENCODE RAW,
    	P_RETAILPRICE NUMERIC(12, 2) ENCODE RAW,
    	P_COMMENT CHAR(256) ENCODE RAW
    );
    
    CREATE TABLE supplier
    (
    	S_SUPPKEY BIGINT ENCODE RAW,
    	S_NAME CHAR(256) ENCODE RAW,
    	S_ADDRESS CHAR(256) ENCODE RAW,
    	S_NATIONKEY BIGINT ENCODE RAW,
    	S_PHONE CHAR(256) ENCODE RAW,
    	S_ACCTBAL NUMERIC(12, 2) ENCODE RAW,
    	S_COMMENT CHAR(256) ENCODE RAW
    );
    
    CREATE TABLE customer
    (
    	C_CUSTKEY BIGINT ENCODE RAW,
    	C_NAME VARCHAR(256) ENCODE RAW,
    	C_ADDRESS VARCHAR(256) ENCODE RAW,
    	C_NATIONKEY BIGINT ENCODE RAW,
    	C_PHONE CHAR(256) ENCODE RAW,
    	C_ACCTBAL NUMERIC(12, 2) ENCODE RAW,
    	C_MKTSEGMENT CHAR(256) ENCODE RAW,
    	C_COMMENT VARCHAR(256) ENCODE RAW
    );
    
    CREATE TABLE partsupp
    (
    	PS_PARTKEY BIGINT ENCODE RAW,
    	PS_SUPPKEY BIGINT ENCODE RAW,
    	PS_AVAILQTY INTEGER ENCODE RAW,
    	PS_SUPPLYCOST NUMERIC(12, 2) ENCODE RAW,
    	PS_COMMENT CHAR(256) ENCODE RAW
    );
    
    CREATE TABLE orders
    (
    	o_orderkey BIGINT DISTKEY ENCODE RAW,
    	o_custkey BIGINT ENCODE RAW,
    	o_orderstatus CHAR(256) ENCODE RAW,
    	o_totalprice NUMERIC(12, 2) ENCODE RAW,
    	o_orderdate CHAR(10) ENCODE RAW,
    	o_orderpriority CHAR(256) ENCODE RAW,
    	o_clerk CHAR(256) ENCODE RAW,
    	o_shippriority INTEGER ENCODE RAW,
    	o_comment VARCHAR(256) ENCODE RAW
    );
    
    CREATE TABLE lineitem
    (
    	l_orderkey BIGINT DISTKEY ENCODE RAW,
    	l_partkey BIGINT ENCODE RAW,
    	l_suppkey INTEGER ENCODE RAW,
    	l_linenumber INTEGER ENCODE RAW,
    	l_quantity NUMERIC(12, 2) ENCODE RAW,
    	l_extendedprice NUMERIC(12, 2) ENCODE RAW,
    	l_discount NUMERIC(12, 2) ENCODE RAW,
    	l_tax NUMERIC(12, 2) ENCODE RAW,
    	l_returnflag CHAR(256) ENCODE RAW,
    	l_linestatus CHAR(256) ENCODE RAW,
    	l_shipdate CHAR(10) ENCODE RAW,
    	l_commitdate CHAR(10) ENCODE RAW,
    	l_receiptdate CHAR(10) ENCODE RAW,
    	l_shipinstruct CHAR(256) ENCODE RAW,
    	l_shipmode CHAR(256) ENCODE RAW,
      l_comment VARCHAR(256) ENCODE RAW
    );
    ```

1. Johnny created the following script to load the data:
    ```sql
    copy region FROM 's3://tpc-h-load-data/raw/region.tbl'
    credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
    compupdate off delimiter '|' ;
    
    copy nation FROM 's3://tpc-h-load-data/raw/nation.tbl'
    credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
    compupdate off delimiter '|' ;
    
    copy part FROM 's3://tpc-h-load-data/raw/part.tbl'
    credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
    compupdate off delimiter '|' ;
    
    copy supplier FROM 's3://tpc-h-load-data/raw/supplier.tbl'
    credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
    compupdate off delimiter '|' ;
    
    copy partsupp FROM 's3://tpc-h-load-data/raw/partsupp.tbl'
    credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
    compupdate off delimiter '|' ;
    
    copy customer FROM 's3://tpc-h-load-data/raw/customer.tbl'
    credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
    compupdate off delimiter '|' ;
    
    copy orders FROM 's3://tpc-h-load-data/raw/orders.tbl'
    credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
    compupdate off delimiter '|' ;
    
    copy lineitem FROM 's3://tpc-h-load-data/raw/lineitem.tbl'
    credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
    compupdate off delimiter '|' ;
    ```
    
## Initial Analysis

### Benchmarks

Before making any changes, you want to understand the current state so you can report an accurate before and after 
picture.

Record the following statistics before making any changes:

table            |load time (sec) |row count    |size (mb) |
-----------------|---------------:|------------:|---------:|
customer         |             32 |   3,750,000 |    2,464 |
lineitem         |          1,506 | 149,996,355 |  165,097 |
nation           |              5 |          25 |       56 |
orders           |            268 |  37,500,000 |   31,181 |
part             |             60 |   5,000,000 |    7,504 |
partsupp         |             72 |  20,000,000 |    5,632 |
region           |              5 |           5 |       30 |
supplier         |              7 |     250,000 |      304 |
**TOTALS**     | **1,955** | **216,496,385** | **212,268** | 

### Best Practices Analysis

1. Which [table design best practices](https://docs.aws.amazon.com/redshift/latest/dg/c_designing-tables-best-practices.html) 
did Johnny follow?

1. Which did he miss?

1. Which [table loading best practices](https://docs.aws.amazon.com/redshift/latest/dg/c_loading-data-best-practices.html) 
did Johnny follow?

1. Which did he miss?

### Sample Queries

Understanding the data model and how the data is queried is important to proper table design. Marketing has provided 
a few typical queries.

1. Record the execution time of each query

1. Record the execution plan for each query

## Apply Table Design Best Practices

The data architect provides the following data model for the marketing data warehouse:

1. Given the information above, update Johnny's table definitions to account for all table design best practices
    ```sql

    ```
1.  Provide hard data to support your choices for distribution styles based on the queries assuming marketing wants
balance storage and load times with good query performance. 

## Apply Table Loading Best Practices

1. Update the table loading script to follow the table loading best practices. 
    ```sql

    ```
1. Drop the existing tables

1. Run the updated copy commands and update the table statistics:
    
    table            |load time (sec) |row count    |size (mb) |
    -----------------|---------------:|------------:|---------:|
    customer         |                |             |          |
    lineitem         |                |             |          |
    nation           |                |             |          |
    orders           |                |             |          |
    part             |                |             |          |
    partsupp         |                |             |          |
    region           |                |             |          |
    supplier         |                |             |          |
    **TOTALS**       |                |             |          | 

1. Record the execution time of each query

1. Record the execution plan for each query

## Summary

Thanks to your hard work, your boss should not have to add resources to the cluster and Marketing should be happy with
the improvements in execution time. Summarize your work below:

1.  How much (in percentage terms) did you reduce storage consumption?

1.  How much (in percentage terms) did you improve query performance?

## Bonus Work

1. Based on the orders table, can additional space be saved using different column encodings?

1. If so, what would the table definition look like for the orders table?

1. Is this a best practice?  Why or why not?

