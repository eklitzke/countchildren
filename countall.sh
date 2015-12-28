#!/bin/bash

for f in tests/*; do
    echo -n "$f "
    ./countchildren.sh "$f"
done
