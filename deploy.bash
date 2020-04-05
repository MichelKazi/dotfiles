#!/bin/bash
RED='\033[0;31m'
echo -e "What did you change?\n"
STR=$"Commit Message: "
read -r -p "$STR" desc 
git add -A
git commit -m "$desc"
git push 
