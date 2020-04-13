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

##Installing Drishti
echo -e "\nINSTALLING \e[31m[Drishti]\e[0m"
git clone https://github.com/devanshbatham/Drishti
cd Drishti
pip3 install -r requirements.txt
echo -e "\nINSTALLING Drishti \e[32mFINISH\e[0m"

##Install qsreplace
echo -e "\nINSTALLING \e[31m[QSreplace]\e[0m"
go get -u github.com/tomnomnom/qsreplace
echo -e "\nINSTALLING Qsreplace \e[32mFINISH\e[0m"

##Install ffuf
echo -e "\nINSTALLING \e[31m[FFUF]\e[0m"
go get github.com/ffuf/ffuf
echo -e "\nINSTALLING FFUF \e[32mFINISH\e[0m"

echo "=============================Done Installing Tools================================="
