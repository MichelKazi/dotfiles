#!/bin/bash

STR=$'What did you change?\n'
read -r -p "$STR" desc 
git add -A
git commit -m "$desc"
git push 
