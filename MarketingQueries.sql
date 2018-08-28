-- Query 1
select
       l_returnflag,
       l_linestatus,
       sum(l_quantity) as sum_qty,
       sum(l_extendedprice) as sum_base_price,
       sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
       sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
       avg(l_quantity) as avg_qty,
       avg(l_extendedprice) as avg_price,
       avg(l_discount) as avg_disc,
       count(*) as count_order
from lineitem
where l_shipdate <= date '1998-12-01' - interval '90' day
group by l_returnflag, l_linestatus
order by l_returnflag, l_linestatus;

-- Query 2
select supp_nation, cust_nation, l_year, sum(volume) as revenue
from (
      select
             n1.n_name as supp_nation,
             n2.n_name as cust_nation,
             -- WORKS:
             -- SUBSTRING(l_shipdate,1,4) as l_year,
             -- SHOULD BE:
             extract(year from l_shipdate) as l_year,
             l_extendedprice * (1-l_discount) as volume
      from supplier, lineitem, orders, customer, nation n1, nation n2
      where s_suppkey = l_suppkey
        and o_orderkey = l_orderkey
        and c_custkey = o_custkey
        and s_nationkey = n1.n_nationkey
        and c_nationkey = n2.n_nationkey
        and (
              (n1.n_name = 'CANADA' and n2.n_name = 'UNITED STATES')
                or (n1.n_name = 'UNITED STATES' and n2.n_name = 'CANADA')
            )
        -- WORKS:
        -- and l_shipdate between '1995-01-01' and '1996-12-31') as shipping
        -- SHOULD BE:
        and l_shipdate between date '1995-01-01' and date '1996-12-31') as shipping 
group by supp_nation, cust_nation, l_year
order by supp_nation, cust_nation, l_year;

-- Query 3
select c_custkey, c_name, sum(l_extendedprice * (1 - l_discount)) as revenue, c_acctbal, n_name, c_address, c_phone, c_comment
from customer, orders, lineitem, nation
where c_custkey = o_custkey
  and l_orderkey = o_orderkey
  and o_orderdate >= date '1993-10-01'
  and o_orderdate < date '1994-02-01'
  and l_returnflag = 'R'
  and c_nationkey = n_nationkey
group by c_custkey, c_name, c_acctbal, c_phone, n_name, c_address, c_comment
order by revenue desc
limit 20;

