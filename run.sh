#!/bin/bash
###
### run.sh - Project actions
###
### Usage:
###   run.sh <action> [options]
###
### Options:
###   <action>
###       clean             Clean build files
###       test  [args]      Run unit tests (also supports -v for verbose mode)
###   -h        Show this message.

help() {
    grep '^### ' "$0" | sed -r 's/^### ?//'
}

if [[ $# == 0 ]] || [[ "$1" == "-h" ]]; then
    help
    exit 1
fi

# List of required commands
commands="go"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if all required commands are available
for cmd in $commands; do
    command_exists "$cmd" || { echo "Command $1 is required but not found. Aborting."; exit 1; }
done

clean ()
{
    echo "Cleaning"
    go clean -cache
}

cmd="$1"
shift

case "$cmd" in
    clean)
        clean
        ;;
    test)
        # Run go test for all packages inside tests/unit
        go test $@ ./...
        exit $?
        ;;
    *)
        echo "Error: unknown command: $cmd"
        help
        ;;
esac
