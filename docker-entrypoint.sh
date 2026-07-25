#!/bin/sh
set -e

# Cache configuration, routes, and views for high performance
php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true
php artisan storage:link --force || true

# Run database migrations if DB_HOST is configured
if [ -n "$DB_HOST" ]; then
    echo "Running database migrations..."
    php artisan migrate --force || true
fi

exec "$@"
