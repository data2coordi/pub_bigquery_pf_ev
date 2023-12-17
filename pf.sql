
select 
    'pf randum colum only', 
	partid, 
	clusterdid, 
	num_col1,
	CURRENT_TIMESTAMP() t 
from 
`ml_dataset.bigdata_for_ev`
where num_col1 = 18500113;

return;
--Advanced
------------------------
-- cluster min vs max
-- part 10 clusterdid min:9500000 max:10499999 
select 
    'pf part+cluster min', 
	partid, 
	clusterdid, 
	num_col1, 
	CURRENT_TIMESTAMP() t 
from 
`ml_dataset.bigdata_for_ev`
where partid = 10 
and   clusterdid=9500000 ; 

select 
    'pf part+cluster middle', 
	partid, 
	clusterdid, 
	num_col1, 
	CURRENT_TIMESTAMP() t 
from 
`ml_dataset.bigdata_for_ev`
where partid = 10 
and   clusterdid=10000000 ; 



select 
    'pf part+cluster max', 
	partid, 
	clusterdid, 
	num_col1, 
	CURRENT_TIMESTAMP() t 
from 
`ml_dataset.bigdata_for_ev`
where partid = 10 
and   clusterdid=10499999 ; 


------------------------

-- seq  vs randum
-- seqid:9500000 num_col1:18500113
select 
    'pf seqid only', 
	partid, 
	clusterdid, 
	seqid, 
	CURRENT_TIMESTAMP() t 
from 
`ml_dataset.bigdata_for_ev`
where seqid = 9500000; 

select 
    'pf randum colum only', 
	partid, 
	clusterdid, 
	num_col1,
	CURRENT_TIMESTAMP() t 
from 
`ml_dataset.bigdata_for_ev`
where num_col1 = 18500113;

------------------------

select 'pf3', partid, seqid, CURRENT_TIMESTAMP() from `ml_dataset.bigdata_for_ev`
where seqid=1000000 and  partid = 10; 

select 'pf4', partid, seqid, CURRENT_TIMESTAMP() from `ml_dataset.bigdata_for_ev`
where seqid=1000000 ; 

select 'pf5', partid, num_col1, CURRENT_TIMESTAMP() from `ml_dataset.bigdata_for_ev`
where num_col1=100000000 ; 

select 'pf6', partid, num_col1, CURRENT_TIMESTAMP() from `ml_dataset.bigdata_for_ev`
where num_col1=50000000 ; 

select 'pf1 non partition ', partid, clusterdid,CURRENT_TIMESTAMP()  from `ml_dataset.bigdata_for_ev_nopart` 
where clusterdid=50000000; 

select 'pf2 non partition ', partid, seqid, CURRENT_TIMESTAMP() from `ml_dataset.bigdata_for_ev_nopart`
where seqid=1000000 ; 



--Basic
------------------------

select 'pf fullscan', partid, clusterdid, num_col1, CURRENT_TIMESTAMP() t  from `ml_dataset.bigdata_for_ev` 
where  num_col1=12091139 ; 


select 'pf part', partid, clusterdid,CURRENT_TIMESTAMP() t  from `ml_dataset.bigdata_for_ev` 
where  num_col1=12091139 and partid = 10 ; 


select 'pf part+cluster', partid, clusterdid,CURRENT_TIMESTAMP() t from `ml_dataset.bigdata_for_ev`
where  num_col1=12091139 and partid = 10 and clusterdid=9700146 ; 
