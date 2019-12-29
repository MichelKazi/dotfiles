#!/bin/bash

read -r -p 'What did you change? ' desc 
git add -A
git commit -m "$desc"
git push 
