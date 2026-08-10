#!/bin/bash
basepath=$(cd "$(dirname "$0")" && pwd)

sudo cp $basepath/../index.html /var/www/html/img2pdf/index.html
sudo chown -R apache:apache /var/www/html/img2pdf/index.html
