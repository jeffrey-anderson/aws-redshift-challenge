select stv_tbl_perm.name as table, count(*) as mb
from stv_blocklist, stv_tbl_perm
where stv_blocklist.tbl = stv_tbl_perm.id
and stv_blocklist.slice = stv_tbl_perm.slice
and stv_tbl_perm.name in ('region','nation','part','supplier','customer', 'partsupp', 'orders', 'lineitem')
group by stv_tbl_perm.name
order by 1 asc;
   

select count(1) from customer;
select count(1) from lineitem;
select count(1) from nation;
select count(1) from orders;
select count(1) from part;
select count(1) from partsupp;
select count(1) from region;
select count(1) from supplier;
