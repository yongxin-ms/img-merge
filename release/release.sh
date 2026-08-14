#!/bin/bash
set -euo pipefail

basepath=$(cd "$(dirname "$0")" && pwd)
src="$basepath/../index.html"
dest_dir="/var/www/html/img-merge"
dest_file="$dest_dir/index.html"

if [ ! -f "$src" ]; then
  echo "错误：找不到源文件 $src" >&2
  exit 1
fi

sudo mkdir -p "$dest_dir"

# 先复制到同目录的临时文件，再用 mv 原子替换，避免并发请求读到写了一半的文件
tmp_file="$dest_dir/.index.html.tmp.$$"
sudo cp "$src" "$tmp_file"
sudo mv "$tmp_file" "$dest_file"

sudo chmod 644 "$dest_file"
sudo chmod 755 "$dest_dir"

echo "部署完成：$dest_file"
