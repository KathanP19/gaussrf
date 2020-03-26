#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

logo(){
 echo "${red}

          ____________________  __   ________________________________
          __  ____/__    |_  / / /   __  ___/_  ___/__  __ \__  ____/
          _  / __ __  /| |  / / /    _____ \_____ \__  /_/ /_  /_
          / /_/ / _  ___ / /_/ /     ____/ /____/ /_  _, _/_  __/
          \____/  /_/  |_\____/      /____/ /____/ /_/ |_| /_/



${reset}"
}

kill(){
        logo
        echo "Usage : ./ssrf.sh domain.com"
        exit 1
}

recon(){
logo
mkdir -p recon
mkdir -p recon/$1

##Getting SubDomains
echo -e "\nRUNNING \e[31m[assetfinder]\e[0m"
assetfinder --subs-only $1 > ./recon/$1/$1.assetfinder.txt
cat ./recon/$1/$1.assetfinder.txt | sort -u > ./recon/$1/subs.txt
echo "FOUND SUBDOMAINS [$(cat ./recon/$1/subs.txt | wc -l)]"
echo -e "RUNNING ASSETFINDER \e[32mFINISH\e[0m"

##Starting GETALLURLS
echo -e "\nRUNNING \e[31m[GAU]\e[0m"
cat  ./recon/$1/subs.txt | gau > ./recon/$1/$1.urls.txt
echo -e "RUNNING GAU \e[32mFINISH\e[0m"

echo "${red} ---------------COLLECTED URLS OF SUBDOMAINS--------------- ${reset}"

##Checking urls with anti-burl
echo -e "\nRUNNING \e[31m[anti-burl]\e[0m"
cat ./recon/$1/$1.urls.txt | grep "=http" | anti-burl | tee ./recon/$1/$1.ssrf.txt
echo -e "RUNNING Anti-burl \e[32mFINISH\e[0m"

##Cleaning the list for urls
echo -e "\nCleaning \e[31m[LIST]\e[0m"
cat ./recon/$1/$1.ssrf.txt | sed 's/[^http]*\(http.*\)/\1/' > ./recon/$1/$1.params_urls.txt
echo "FOUND POSSIBLE SSRF URLS [$(cat ./recon/$1/$1.params_urls.txt | wc -l)]"
echo "${red} --------------DONE---------------- ${reset}"
}
if [ -z "$1" ]
        then
                kill
else
        recon $1
fi
