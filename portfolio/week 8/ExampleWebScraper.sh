#!/bin/bash

# just preserving newlines
IFS=

# get webpage content
content=$(curl -s http://example.com)
# get heading
echo "$content" | sed -rn "s@<h1>(.*)</h1>@\1@p"
# get paragraph
echo "$content" | sed -rn "s@<p>(.*)</p>@\1@p"