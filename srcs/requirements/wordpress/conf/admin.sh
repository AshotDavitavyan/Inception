wp core install --url=localhost --title="inception" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL}
if wp user get adavitav >/dev/null 2>&1; then
    echo "User adavitav exists."
else
   wp user create ${WP_USER} ${WP_EMAIL} --role=subscriber --user_pass=${WP_PASS}
fi
wp user update ashot --user_pass="${WP_ADMIN_PASS}" --skip-email
if wp user get ashot >/dev/null 2>&1; then
    echo Logged in successfully as root.
else
    echo Login failed. Please check your root credentials.
fi
/usr/sbin/php-fpm8 -F
