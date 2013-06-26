php5-nginx-vagrant-sample
=========================

[English Readme](https://github.com/yandod/php5-nginx-vagrant-sample/blob/master/README_en.md)

Vagrantを使ってPHPとMySQLが動作する環境を自動で設定します。OSなどに依存しないXAMPP/MAMPのようなものと考えてください。

<table>
<tr>
<th>OS</th>
<td>Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64)</td>
</tr>
<tr>
<th>PHP</th>
<td>PHP 5.3.10-1ubuntu3.6 with Suhosin-Patch</td>
</tr>
<tr>
<th>Nginx</th>
<td>1.1.19</td>
</tr>
<tr>
<th>MySQL</th>
<td>5.5.31-0ubuntu0.12.04.2 (Ubuntu)</td>
</tr>
</table>


PHPカンファレンス関西2013の講演で使ったコードなど

スライドはこちらです。
[Chef + Vagrantで作るこれからの開発環境とクラウド](https://speakerdeck.com/yandod/chef-plus-vagrantdezuo-rukorekarafalsekai-fa-huan-jing)


## 使い方

### VirtualBoxをダウンロードしてインストール
VirtualBoxをセットアップしてください。
[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

### Vagrantをダウンロードしてインストール
最新版をインストールしてください。
[http://downloads.vagrantup.com/](http://downloads.vagrantup.com/)

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
またサーバ内にSSHしたい場合はvagrantコマンドを使います。

<pre>
vagrant ssh
</pre>

### 終了
vagrantコマンドで仮想マシンを終了、又は破棄出来ます。

一旦止めるだけの場合。
<pre>
vagrant halt
</pre>

データを破棄する場合。次回、<code>vagrant up</code>の際にはまっさらなマシンが作成される。
<pre>
vagrant destroy
</pre>

