#! /bin/bash

set -e

main() {
    local -r interval=${1:-15}
    local this_exe_file_path=$(realpath "$0")
    local this_exe_dir_path=$(dirname "$this_exe_file_path")
    local snap_exe_file_name='snapshot.sh'
    local snap_exe_file_path="$this_exe_dir_path"/"$snap_exe_file_name"

    while :; do
        $snap_exe_file_path 1> out 2> err || true
        sleep "$interval"
    done
}

main "$@"
