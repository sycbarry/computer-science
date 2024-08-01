#!/bin/bash

message=$1
if [[ ! $message ]]; then
    echo "Please provide a commit message"
    exit 1
fi
git add --all
git commit -m "$message"
git push origin main
