copy region FROM 's3://tpc-h-load-data/psvgz/region.tbl.gz'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
gzip delimiter '|' ;

copy nation FROM 's3://tpc-h-load-data/psvgz/nation.tbl.gz'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
gzip delimiter '|' ;

copy part from 's3://tpc-h-load-data/psvgz/part.manifest' 
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
gzip delimiter '|' manifest;

copy supplier from 's3://tpc-h-load-data/psvgz/supplier.manifest' 
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
gzip delimiter '|' manifest;

copy partsupp from 's3://tpc-h-load-data/psvgz/partsupp.manifest' 
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
gzip delimiter '|' manifest;

copy customer from 's3://tpc-h-load-data/psvgz/customer.manifest' 
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
gzip delimiter '|' manifest;

copy orders from 's3://tpc-h-load-data/psvgz/orders.manifest' 
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
gzip delimiter '|' manifest;

copy lineitem from 's3://tpc-h-load-data/psvgz/lineitem.manifest' 
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/myRedshiftRole' 
gzip delimiter '|' manifest;
