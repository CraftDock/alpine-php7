#!/usr/bin/env bash

# set -e : Exit the script if any statement returns a non-true return value.
# set -u : Exit the script when using uninitialised variable.
set -eu

# folder
www_dir="/var/www"

# Create folder if necessary
if [[ ! -d "$www_dir" ]]; then
    DEBUG "Creating www folder: $www_dir"
    mkdir -p $www_dir
fi

# Update owner
if [[ -n "$USER" ]]; then
    chown -R "$USER" "${www_dir}" || true
elif [[ -n "$(getent passwd www-data)" ]]; then
    chown -R www-data:www-data "${www_dir}" || true
fi

# Update permissions
chmod -R 776 "${www_dir}" || true
