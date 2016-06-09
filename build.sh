#!/usr/bin/env bash

set -e

mkdir -p build;
cd build;

# Generate a new parser.
pegjs ../parser.peg

# Generate a htmlified version of the grammar.
echo "<html>" > parser.html
cat ../parser.peg | sed 1d | sed 1d | sed 1d | \
    awk -F "\n" '{print $0 " <br/>"}' | \
    sed 's/ /\&nbsp;/g' >> parser.html

echo "</html>" >> parser.html
