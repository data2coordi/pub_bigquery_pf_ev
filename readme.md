

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


# 検証結果からの結論
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


対象ページが保有する最小値、最大値を保有している。
この仕組みで上記の3つとも対象ページのみREADすることが可能。
シーケンシャルに増加する項目の場合はこの仕組みであれば最小限のデータページだけをREAD
することができるしかし、ランダムに分散されたデータだと大量のランダムIOとなってしまうので
フルスキャンしてしまった方が高速。





