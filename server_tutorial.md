[Setting up a Vanilla FXServer - Linux](https://docs.fivem.net/docs/server-manual/setting-up-a-server-vanilla/#linux)
[Server Commands](https://docs.fivem.net/docs/server-manual/server-commands/)

# Tutorial for Ubunto 20.04 - 64 bit

## Prerequisites

    sudo apt update
    sudo apt install git
    git --version
    sudo apt install xz-utils
    xz --version

## Installation
1. Server binaries

        cd
        mkdir -p ~/FXServer/server
        cd ~/FXServer/server
        wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5402-810a639673d8da03fe4b1dc2b922c9c0265a542e/fx.tar.xz
        tar xf fx.tar.xz

2. Server data

        cd
        mkdir -p ~/FXServer/server-data
        git clone https://github.com/citizenfx/cfx-server-data.git ~/FXServer/server-data
        
3. Server config

        cd ~/FXServer/server-data
        nano server.cfg

- Set the license key in your server.cfg using sv_licenseKey "licenseKeyGoesHere".

4. UFW Setup

        sudo ufw allow 30120:30130/tcp
        sudo ufw allow 30120:30130/udp
        sudo systemctl restart ufw

5. Run 

        cd ~/FXServer/server-data && bash ~/FXServer/server/run.sh +exec server.cfg

6. Make yourself an admin

    - Get your from `steamID64 (Hex)` [steamidfinder](https://www.steamidfinder.com/)
    - edit `server.cfg`
        - Add system admins > `add_principal identifier.steam:110000104713c9a group.admin # add the admin to the group`

7. [Enforce game build](https://docs.fivem.net/docs/server-manual/server-commands/#sv_enforcegamebuild-build), by default is arena war

        sv_enforceGameBuild 2545

## Problems and solutions
- Problem: `Server list query returned an error: System.Threading.Tasks.TaskCanceledException`
  - Solution: 99% of the reason is networking and not correctly portforward or firewall setup
- Teamviewr copy paste does not work from the windows machine
        
        sudo teamviewer --daemon restart

- Update user in mysql

        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';




## Adding [vMenu](https://docs.vespura.com/vmenu/installation/)

## Update the server with latest recommended build - [Update FiveM Server](https://forum.cfx.re/t/update-fivem-server/241474)
- get your server version - type `version` in your server console, it should show something like this:

        [                 cmd]  "version" is "FXServer-master v1.0.0.5402 linux"
        [                 cmd]  default: "FXServer-master v1.0.0.5402 linux" - flags( )
        [                 cmd]  type: string

- your version is `5402`, open [this link](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/) and check if there is new version

### Approach 1 - with FTP
0. Stop server   
1. Delete existing files in `/FXServer/server` folder
2. Download the latest artifact and extract it to your `/FXServer/server` folder
3. Start server
### Approach 2 - in Ubuntu
0. Stop server  
[latest recommended build](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)

        su steam
        cd ~/FXServer/
        rm -rf server/*
        cd server
        wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5402-810a639673d8da03fe4b1dc2b922c9c0265a542e/fx.tar.xz / {latest recommended build}
        tar xf fx.tar.xz

1. Start server

## Install MySQL on Ubuntu
Sources:
[digitial ocean](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04) |
[linode](https://www.linode.com/docs/guides/installing-and-configuring-mysql-on-ubuntu-2004/) | 
[hevodata](https://hevodata.com/learn/installing-mysql-on-ubuntu-20-04/)
### Installing
    sudo apt update
    sudo apt install mysql-server
    sudo systemctl start mysql.service
    mysql --version
    sudo mysql_secure_installation

Current version installed `mysql  Ver 8.0.28-0ubuntu0.20.04.3 for Linux on x86_64 ((Ubuntu))`

### Configuring
- when asked to set up the Validate Password Plugin, select `NO`
- set a password for the MySQL root user

From there, you can press Y and then ENTER to accept the defaults for all the subsequent questions. This will remove some anonymous users and the test database, disable remote root logins, and load these new rules so that MySQL immediately respects the changes you have made.

### Creating a Dedicated MySQL User and Granting Privileges
    sudo mysql
    CREATE USER 'your_mysqluser'@'%' IDENTIFIED WITH caching_sha2_password BY 'your_password';
    GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'your_mysqluser'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    exit

### [Remote access](https://www.digitalocean.com/community/tutorials/how-to-allow-remote-access-to-mysql)
To access MySQL remotely, ensure MySQL traffic is allowed through the ufw firewall. Add the following rule to open port 3306 on the firewall.
   
    sudo ufw allow mysql
    sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

Change this line from `bind-address            = 127.0.0.1`  to `bind-address            = 0.0.0.0`

    sudo systemctl restart mysql

Also in the end don't forget to port forward MySQL deffault port (`3306`) in your router



