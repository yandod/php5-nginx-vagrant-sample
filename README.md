php5-nginx-vagrant-sample
=========================

Vagrantを使ってPHPとMySQLが動作する環境を自動で設定します。OSなどに依存しないXAMPP/MAMPのようなものと考えてください。

PHPカンファレンス関西2013の講演で使ったコードなど

スライドはこちらです。
[Chef + Vagrantで作るこれからの開発環境とクラウド](https://speakerdeck.com/yandod/chef-plus-vagrantdezuo-rukorekarafalsekai-fa-huan-jing)


## 使い方

### VirtualBoxをダウンロードしてインストール
VirtualBoxをセットアップしてください。
[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

### Vagrantをダウンロードしてインストール
最新版をインストールしてください。
[http://downloads.vagrantup.com/]()http://downloads.vagrantup.com/)

### このリポジトリをクローン
gitでクローンするか、ZIPなどでダウンロードしてください。
<pre>
git clone git://github.com/yandod/php5-nginx-vagrant-sample.git
</pre>

### ソースコードの準備
./sandbox以下に動作させたいPHPのソースなどを置く又はVagrantfileの設定を書き換えて任意のディレクトリを指します。これでソースコードが仮想マシン内に同期するのでローカルで編集できます。

### vagrantを起動
クローンしたリポジトリ内でvagrantを起動。初回のみOSのダウンロードに時間がかかります。
<pre>
cd php5-nginx-vagrant-sample
vagrant up
</pre>

### 動作確認
http://192.168.33.10 にアクセスする。IPアドレスを変更する場合はVagrantfileを編集します。

