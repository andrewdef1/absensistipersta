# **Absensi STIPER STA JAYAPURA**


# install semua package
composer install

# pilih salah satu
# 1. windows
copy .env.example .env
# 2. unix (ubuntu, mac os and others)
cp .env.example .env

# setelah itu, setting .env file seperti nama database (DB_DATABASE), username dan passwordnya
# lalu buat database baru dari phpmyadmin atau cli langsung juga bisa dengan nama sesuai DB_DATABASE yang ada di file .env
php artisan key:generate
php artisan migrate
php artisan serve

# lalu buka browser dengan url: http://localhost:8000/
```

## How to install/use (english)

-   Clone this repository

-   Install all packages

```sh
composer install
```

-   Copy/rename file .env.example to .env

```sh
# windows
copy .env.example .env
# unix (ubuntu, mac os and others)
cp .env.example .env
```

-   Configure .env file
    <br>
    Open your .env file and change the database name (DB_DATABASE) to whatever you have, username (DB_USERNAME) and password (DB_PASSWORD) field correspond to your configuration.

-   Create database
    <br>
    Create a database according to the name in DB_DATABASE in the .env file
