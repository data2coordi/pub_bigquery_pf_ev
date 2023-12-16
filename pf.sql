
# Bigqueryの性能検証
# 目的

Bigqueryの性能を検証することを目的として、検証環境を公開する。
Bigqueryの性能検証をしたい人が本リポジトリを利用して簡単に検証を開始できれば幸いです。

また、以下検証結果を公開する。

***パーティションについて***

パーティション+クラスタリングの構成ではパーティション内のデータはクラスターキーがヒットするまで
スキャンしてヒットした時点でスキャンが停止するのか？
またはパーティション内の不要なデータページはスキップして
対象のクラスタキーが存在するデータページのみをリードするようなことが可能なのか？


***クラスターキーについて***

パーティションキー指定なしでクラスターキーのみを指定した場合、
パーティションの効果はないのか？


***パーティションキー、クラスターキー指定なしのスキャンについて***
必ずフルスキャンするのか？実感としては、必ずフルスキャンしているようには思えない。
非常に高速な場合もある。どのような仕組みなのか？


# 結論
先に検証結果から判断した結論を記載しておく。
※ 公式ドキュメントで結論が正しいか確認できていないのでその旨、留意ください。
確証を得るための情報を公式サイトで探してみましたが今のところ見つけることができませんでした。

***パーティションについて***
対象のクラスタキーが存在するデータページのみをリードしている。
データページ毎に項目毎の最大値、最小値を保有しており、条件に合致するページのみREADしている。


***クラスターキーについて***

対象のクラスタキーが存在するデータページのみをリードしている。
データページ毎に項目毎の最大値、最小値を保有しており、条件に合致するページのみREADしている。


***パーティションキー、クラスターキー指定なしのスキャンについて***

対象の項目値が存在するデータページのみをリードしている。
データページ毎に項目毎の最大値、最小値を保有しており、条件に合致するページのみREADしている。





select 'pf1', partid, clusterdid,CURRENT_TIMESTAMP() from `ml_dataset.bigdata_for_ev`
where clusterdid=1000000 and  partid = 10; 

select 'pf2', partid, clusterdid,CURRENT_TIMESTAMP()  from `ml_dataset.bigdata_for_ev` 
where clusterdid=50000000; 

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



SELECT
  query,
  total_bytes_processed AS processed_bytes,
  total_bytes_processed / 1024 / 1024  AS processed_MB,
  total_bytes_processed / 1024 / 1024 / 1024  * 1 AS Charges_yen,
  end_time-start_time,
  start_time,
  end_time,
  cache_hit,
  total_bytes_billed / 1024 / 1024 AS billed_MB,
FROM
`region-us-central1`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
WHERE
  query like '%pf%ml_dataset%'  and query not like '%INFORMATION_SCHEMA%'
ORDER BY DATETIME(creation_time)  DESC
LIMIT 100;

