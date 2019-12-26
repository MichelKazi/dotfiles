#!/bin/bash
read -r -p 'What did you change? ' ${desc} # prompt user for commit message
git add .
git add -u
git commit -m "$desc"
git push 
