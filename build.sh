#!/usr/bin/env bash

set -e

# Generate a new parser.
pegjs parser.peg;

# Generate a htmlified version of the grammar.
mkdir -p build;
echo "<html>" > build/parser.html
cat parser.peg | sed 1d | sed 1d | sed 1d | \
    awk -F "\n" '{print $0 " <br/>"}' | \
    sed 's/ /\&nbsp;/g' >> build/parser.html;

echo "</html>" >> build/parser.html;

mv parser.js build/parser.js;
