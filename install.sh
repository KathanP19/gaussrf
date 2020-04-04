#!/bin/bash

echo "============================Installing Tools For GAUSSRF=========================="
echo " "

##Install Assetfinder
echo -e "\nINSTALLING \e[31m[assetfinder]\e[0m"
go get -u github.com/tomnomnom/assetfinder
echo -e "\nINSTALLING ASSETFINDER \e[32mFINISH\e[0m"

##Install GAU
echo -e "\nINSTALLING \e[31m[GAU]\e[0m"
go get -u github.com/lc/gau
echo -e "\nINSTALLING GAU \e[32mFINISH\e[0m"

##Install Anti-burl
echo -e "\nINSTALLING \e[31m[Anti-burl]\e[0m"
go get -u github.com/tomnomnom/hacks/anti-burl
echo -e "\nINSTALLING Anti-burl \e[32mFINISH\e[0m"

echo "=============================Done Installing Tools================================="
