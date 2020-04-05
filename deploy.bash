#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
NC='\033[0m'

echo -e "${GREEN}What did you change?\n${NC}"
echo -e "${BOLD}Type in your commit message below: ${NORMAL}"
read -r  desc 
git add -A
git commit -m "$desc"
git push 

echo -e "Your dotfiles have been pushed"
