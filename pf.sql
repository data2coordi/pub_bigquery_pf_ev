



--Basic
------------------------
------------------------
------------------------

select 
	'pf fullscan', 
	partid, 
	clusterdid, 
	num_col1, 
	CURRENT_TIMESTAMP() t  
from `ml_dataset.bigdata_for_ev` 
where num_col1=12091139 ; 


select 
	'pf part', 
	partid, 
	clusterdid,
	CURRENT_TIMESTAMP() t  
from `ml_dataset.bigdata_for_ev` 
where num_col1=12091139 
and   partid = 10 ; 


select 
	'pf part+cluster', 
	partid, 
	clusterdid,
	CURRENT_TIMESTAMP() t 
from `ml_dataset.bigdata_for_ev`
where num_col1=12091139 
and   partid = 10
and   clusterdid=9700146 ; 


--Advanced
------------------------
------------------------
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




