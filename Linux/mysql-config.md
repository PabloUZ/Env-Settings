# MySQL SETUP

1. Install
```bash
sudo apt install mysql-server mysql-client
```

2. Config
```bash
sudo mysql_secure_installation
```

3. Set root password
  - Stop service
    ```bash
    sudo systemctl stop mysql
    ```
  - Create directory
    ```bash
    sudo mkdir -p /var/run/mysqld
    sudo chown mysql:mysql /var/run/mysqld
    ```
  - Start in secure mode
    ```bash
    sudo mysqld_safe --skip-grant-tables --skip-networking &
    ```
  - Enter mysql CLI
    ```bash
    sudo mysql -u root
    ```
  - Change password
  ```bash
  FLUSH PRIVILEGES;
  update mysql.user set authentication_string = concat('*', upper(sha1(unhex(sha1('<password>'))))), plugin = 'mysql_native_password' where user = 'root';
  FLUSH PRIVILEGES;
  ```
