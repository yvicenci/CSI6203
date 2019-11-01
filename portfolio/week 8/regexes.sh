#!/bin/bash

# grep on portfolio directory

# All sed statements
grep -r sed ../
# starts with letter m
grep -r "^m" ../
# contain three digits
grep -r -e '[[:digit:]]\{3\}'
# starts with vowel
grep -r '^[aeiou]' ../
# contains loops
grep -r '\(while\|until\|for\).*do' ../
# at least three words
grep -r -e 'echo.*\([[:blank:]]\([[:alpha:]]\)\+\([[:blank:]]\)*\)\{3\}' ../