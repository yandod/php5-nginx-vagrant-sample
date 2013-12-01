php5-nginx-vagrant-sample
=========================

[English Readme](https://github.com/yandod/php5-nginx-vagrant-sample/blob/master/README_en.md)

Vagrantを使ってPHPとMySQLが動作する環境を自動で設定します。OSなどに依存しないXAMPP/MAMPのようなものと考えてください。
またPostgreSQLやImageMagickもセットアップしてあります。

<table>
<tr>
<th>OS</th>
<td>Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64)</td>
</tr>
<tr>
<th>PHP</th>
<td>PHP 5.5.6-1+debphp.org~precise+2</td>
</tr>
<tr>
<th>Nginx</th>
<td>1.1.19</td>
</tr>
<tr>
<th>MySQL</th>
<td>5.5.31-0ubuntu0.12.04.2 (Ubuntu)</td>
</tr>
<tr>
<th>PostgreSQL</th>
<td>9.1.9</td>
</tr>
<tr>
<th>curl</th>
<td>7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8y zlib/1.2.5</td>
</tr>
<tr>
<th>ImageMagick</th>
<td>8:6.6.9.7</td>
</tr>
</table>

## update

クックブックの管理をBerkshelfで行うように変更し、PHP5.5を導入するように変更しました。利用の際はvagrant-berkshelfプラグインのインストールをお願いします。
また、パッケージの取得にかかる時間が少し長くなりましたので、元に戻したい方はPHPのバージョンを指定している部分をコメントアウトしてください。

<pre>
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "php5_ppa::from_ondrej"
    chef.add_recipe "omusubi"
    versions = {};
    # if you would use php5.3 family with fast boot,  comment out lines bellow.
    versions['php5'] = '5.5.*'
    versions['php5-mysql'] = '5.5.*'
    versions['php5-pgsql'] = '5.5.*'
    versions['php5-curl'] = '5.5.*'
    versions['php5-mcrypt'] = '5.5.*'
    versions['php5-cli'] = '5.5.*'
    versions['php5-fpm'] = '5.5.*'
    versions['php-pear'] = '5.5.*'
    versions['php5-imagick'] = '3.*'
    chef.json = {doc_root: doc_root, 'versions' => versions}
  end
</pre>

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

### Vagrant Berkshelfプラグインをインストール
コマンドでインストールします。

    $ vagrant plugin install vagrant-berkshelf

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
http://127.0.0.1:8080 にアクセスする。IPアドレスを変更する場合はVagrantfileを編集します。
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

