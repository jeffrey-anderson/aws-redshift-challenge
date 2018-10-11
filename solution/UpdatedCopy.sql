-- Copy commands that load from multiple compressed files but don't follow the best
-- practice of using a manifest file:

copy region FROM 's3://tpc-h-load-data/psv-gz/region.tbl.gz'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/redshift-s3-ro-access'
gzip compupdate on delimiter '|' ;

copy nation FROM 's3://tpc-h-load-data/psv-gz/nation.tbl.gz'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/redshift-s3-ro-access'
gzip compupdate on delimiter '|' ;

copy part FROM 's3://tpc-h-load-data/m-psv-gz/part/'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/redshift-s3-ro-access'
gzip compupdate on delimiter '|' ;

copy supplier FROM 's3://tpc-h-load-data/m-psv-gz/supplier/'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/redshift-s3-ro-access'
gzip compupdate on delimiter '|' ;

copy partsupp FROM 's3://tpc-h-load-data/m-psv-gz/partsupp/'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/redshift-s3-ro-access'
gzip compupdate on delimiter '|' ;

copy customer FROM 's3://tpc-h-load-data/m-psv-gz/customer/'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/redshift-s3-ro-access'
gzip compupdate on delimiter '|' ;

copy orders FROM 's3://tpc-h-load-data/m-psv-gz/orders/'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/redshift-s3-ro-access'
gzip compupdate on delimiter '|' ;

copy lineitem FROM 's3://tpc-h-load-data/m-psv-gz/lineitem/'
credentials 'aws_iam_role=arn:aws:iam::215087568033:role/redshift-s3-ro-access'
gzip compupdate on delimiter '|' ;