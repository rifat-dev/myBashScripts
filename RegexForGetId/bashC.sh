#!/bin/bash
grep -o '\[ID: [^]]*\]' file.txt | sed -n 's/\[ID: \([^]]*\)\]/\1/p'
