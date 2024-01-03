#! /bin/bash

set -e

QUALITY=10     # 10-100. Ignored for PNG, which is lossless.
COMPRESSION=0  # 0-9. Ignored for JPEG, where "quality" bundles compression.
FORMAT=jpeg    # jpeg | png

DATA_DIR_NAME=data

datestamp=$(TZ=America/New_York date +%F)
timestamp=$(TZ=America/New_York date +%F--%T)

exe_file_path=$(realpath "$0")
exe_dir_path=$(dirname "$exe_file_path")
data_dir_path="$exe_dir_path"/"$DATA_DIR_NAME"/"$datestamp"

out_file_name="$timestamp"."$FORMAT"
out_file_path="$data_dir_path"/"$out_file_name"

mkdir -p "$data_dir_path"
cd "$data_dir_path"

if [ "$XDG_SESSION_TYPE" = wayland ]; then
    grim -t "$FORMAT" "$out_file_path"
else
    DISPLAY=:0 scrot --quality "$QUALITY" --compression "$COMPRESSION" --format "$FORMAT" "$out_file_path"
fi
