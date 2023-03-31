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

import file DB yang ada didalam folder database ke phpmyadmin atau database pendukung lainnya

php artisan serve

# lalu buka browser dengan url: http://localhost:8000/ and u rdy to go !
```
