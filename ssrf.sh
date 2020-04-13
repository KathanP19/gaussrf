#!/bin/bash

red=`tput setaf 1`
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

killit(){
        logo
        echo "Usage : ./ssrf.sh domain.com"
        echo "Usage : ./ssrf.sh domain.com -o output_directory"
        echo "Usage : ./ssrf.sh domain.com --output output_directory"
        exit 1
}

recon(){
logo

##Getting SubDomains
echo -e "\nRUNNING \e[31m[assetfinder]\e[0m"
assetfinder --subs-only $1 > $output_directory/$1/$1.assetfinder.txt
cat $output_directory/$1/$1.assetfinder.txt | sort -u > $output_directory/$1/subs.txt
echo "FOUND SUBDOMAINS [$(cat $output_directory/$1/subs.txt | wc -l)]"
echo -e "RUNNING ASSETFINDER \e[32mFINISH\e[0m"

##Starting GETALLURLS
echo -e "\nRUNNING \e[31m[GAU]\e[0m"
cat  $output_directory/$1/subs.txt | gau > $output_directory/$1/$1.urls.txt
echo -e "RUNNING GAU \e[32mFINISH\e[0m"

echo "${red} ---------------COLLECTED URLS OF SUBDOMAINS--------------- ${reset}"

##Filter Urls to check with drishti
echo -e "\n\e[31m[Filtering Urls with params]\e[0m"
cat $output_directory/$1/$1.urls.txt | grep "=http" | tee $output_directory/$1/$1.urls_with_params.txt
echo -e "Filtering Urls with params completed \e[32mFINISH\e[0m"

##Cleaning the list for urls
echo -e "\nChecking for Live Urls \e[31m[LIST]\e[0m"
cp $output_directory/$1/$1.urls_with_params.txt ./Drishti/
mv ./Drishti/$1.urls_with_params.txt ./Drishti/raw_urls.txt
cd ./Drishti
python3 drishti.py
cd ..
cp Results-200.txt $output_directory/$1/
rm ./Drishti/raw_urls.txt
echo "FOUND POSSIBLE SSRF URLS [$(cat $output_directory/$1/Results-200.txt | wc -l)]"
echo -e "Checking for Live Urls \e[32mFINISH\e[0m"

##FUZZ
echo -e "\nHope You Have Added Burp Collab Url In burp.txt Fuzzing\e[31m[LIST]\e[0m"
cat $output_directory/$1/Results-200.txt | qsreplace FUZZ > $output_directory/$1/fuzzable.txt
cat $output_directory/$1/fuzzable.txt | while read url;do ffuf -w ./burp.txt -u "$url" -v;done
echo "${red} --------------DONE---------------- ${reset}"
}

if [[ -z "$1" || $1 == "-h" || $1 == "--help" ]]
        then
                killit
elif [[ $2 == "-o" || $2 == "--output" ]]
then
  output_directory="$3/gaussrf/recon/"
  mkdir -p "$output_directory"/"$1"
  recon $1
else
  output_directory="recon"
  mkdir -p "$output_directory"/"$1"
  recon $1
fi
