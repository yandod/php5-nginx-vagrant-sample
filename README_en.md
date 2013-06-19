php5-nginx-vagrant-sample
=========================

This create development enviroment uses PHP,MySQL and nginx on Vagrant.

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


This repo was presented on PHP Conferece Kansai 2013 (Osaka, Japan)

Slides.
[Chef + Vagrantで作るこれからの開発環境とクラウド](https://speakerdeck.com/yandod/chef-plus-vagrantdezuo-rukorekarafalsekai-fa-huan-jing)


## How to use

### VirtualBox setup
download and install VirtualBox.
[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

### Vagrant setup
install latest version.
[http://downloads.vagrantup.com/]()http://downloads.vagrantup.com/)

### clone repo
clone this repo or download as ZIP ball.
<pre>
git clone git://github.com/yandod/php5-nginx-vagrant-sample.git
</pre>

### source code
pleace php scripts under <code>./sandbox</code> or edit Vagrantfile to point your directory which contains php scripts. source code will be synced into VM, you can use your own IDE or editor on your workstation.

### boot vagrant
kick vagrant command in cloned repo. long time download happens on first time run.
<pre>
cd php5-nginx-vagrant-sample
vagrant up
</pre>

### test
open http://192.168.33.10 edit Vagrantfile to change the ip.
use <code>vagrant ssh</code> to ssh into your VM.

<pre>
vagrant ssh
</pre>

### termination
use vagrant command to stop or destroy your box.

temporary stop.
<pre>
vagrant halt
</pre>

destroy permernetlly, next time kick <code>vagrant up</code>, new machine will be created.<pre>
vagrant destroy
</pre>

