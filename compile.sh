#! /bin/bash

set -e

main() {
    local -r data_dir_path=${1:-data}
    local -r framerate=${2:-5}
    local -r snapshot_seq_pattern='%09d'
    local -r snapshot_file_ext='jpeg'

    while read -r day_data_dir_path; do
        day=$(basename "$day_data_dir_path");
        temp_dir_path=temp/"$day"
        i=0
        mkdir -p "$temp_dir_path"
        while read -r snapshot_file_path; do
            ((i++)) || true # XXX Annoying.
            seq_file_path="$temp_dir_path"/"$(printf "$snapshot_seq_pattern" $i)"."$snapshot_file_ext"
            # printf '[debug] %s ---> %s\n' "$snapshot_file_path" "$seq_file_path" >&2
            cp "$snapshot_file_path" "$seq_file_path"
        done < <(find "$day_data_dir_path" -mindepth 1 -maxdepth 1 -type f -iname "*.${snapshot_file_ext}" | sort)
        ffmpeg -y -nostdin -framerate "$framerate" -i "$temp_dir_path"/"$snapshot_seq_pattern"."$snapshot_file_ext" -c:v libx264 -pix_fmt yuv420p "$day".mp4
        rm -r "$temp_dir_path"
    done < <(find "$data_dir_path" -mindepth 1 -maxdepth 1 -type d | sort)
}

main "$@"
