Agar Localhost Xampp dapat di Akses di Komputer Lain

httpd.conf

Carilah tulisan “LoadModule vhost_alias_module modules/mod_vhost_alias.so” lalu hilangkan tanda # yang ada di depannya.

Carilah tulisan “Include “conf/extra/httpd-vhosts.conf “ lalu hilangkan tanda # di depannya


http-xampp.conf


Selanjutnya ketik IP address sebelum tulisan

Allow from 192.168.1.10
Allow from 192.168.1.11
ErrorDocument 403 /error/XAMPP_FORBIDDEN.html.var

Untuk merubah agar semua computer yang terhubung dapat mengakses localhost maka rubah
“order deny, allow dan Deny from all” menjadi “Allow from all”.
Restart Xampp Anda.