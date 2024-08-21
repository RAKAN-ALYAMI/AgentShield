#!/bin/bash

# Copyright (c) 2024 RAKAN ALYAMI. All rights reserved.
# Contact: 
# Email: rakan7777@gmail.com
# Telegram: https://t.me/r7000r

# التحقق من تثبيت Nginx
if ! command -v nginx &> /dev/null
then
    echo "Nginx is not installed. Please install Nginx first before running this script."
    exit 1
fi

# ملف السجل لتسجيل عناوين IP المحظورة و "User Agents"
LOG_FILE="/var/log/blocked_ips.log"
NGINX_CONF="/etc/nginx/conf.d/blocked_user_agents.conf"

# وظيفة لفتح جميع الزيارات (إعدادات افتراضية)
function allow_all_access {
    sudo rm -f $NGINX_CONF
    sudo systemctl reload nginx
}

# وظيفة لحظر الوصول بناءً على User Agent عبر Nginx وتسجيله
function block_by_user_agent {
    read -p "Please enter the User Agent you want to block: " blocked_user_agent

    sudo tee -a $NGINX_CONF > /dev/null <<EOL
if (\$http_user_agent ~* "$blocked_user_agent") {
    return 403;
}
EOL

    sudo systemctl reload nginx

    echo "Blocked User Agent: $blocked_user_agent" >> $LOG_FILE
}

# وظيفة لإزالة جميع القواعد والحظر
function remove_all_blocks {
    sudo rm -f $NGINX_CONF
    sudo systemctl reload nginx
    > $LOG_FILE
}

# وظيفة لعرض الزيارات المحظورة
function view_blocked_visits {
    if [ -f "$LOG_FILE" ]; then
        cat "$LOG_FILE"
    fi
}

# عرض القائمة الرئيسية
while true; do
    echo "Options:"
    echo "1. Allow all access (default)"
    echo "2. Block access by User Agent"
    echo "3. View blocked visits"
    echo "4. Remove all blocks and firewall rules"
    echo "5. Exit"
    read -p "Choose an option: " option

    case $option in
        1) allow_all_access ;;
        2) block_by_user_agent ;;
        3) view_blocked_visits ;;
        4) remove_all_blocks ;;
        5) exit ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
