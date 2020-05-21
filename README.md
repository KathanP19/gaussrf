# gaussrf
```


____________________  __   ________________________________
__  ____/__    |_  / / /   __  ___/_  ___/__  __ \__  ____/
_  / __ __  /| |  / / /    _____ \_____ \__  /_/ /_  /_    
/ /_/ / _  ___ / /_/ /     ____/ /____/ /_  _, _/_  __/    
\____/  /_/  |_\____/      /____/ /____/ /_/ |_| /_/       
                                                           


```
Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl and Filter Urls With OpenRedirection or SSRF Parameters. This Tool was built to present in Null Ahmedabad [Deep Dive into SSRF](https://null.co.in/event_sessions/3086-deep-dive-into-ssrf) you can get slides from the link.

## Prerequisites

* [GetAllUrls](https://github.com/lc/gau) - For Fetching Urls
* [Assetfinder](https://github.com/tomnomnom/assetfinder) - For Subdomain Enumeration
* [Drishti](https://github.com/devanshbatham/Drishti) - For check if url is live or not.

You can now use install.sh to install require tools, this tools where made in go it should be installed in your system and dont forget to set path of go properly.
```bash
$ sudo chmod +x install.sh
$ ./install.sh
```
### Installation

```bash
$ git clone https://github.com/KathanP19/gaussrf.git
$ cd gaussrf/
$ sudo chmod +x ssrf.sh
``` 
### Usage
Dont Forget to put your blind ssrf testing link or burp collab link in `burp.txt`
or you can use thi site [SSRFTest](https://ssrftest.com/) if you dont have BurpPro

```
          ____________________  __   ________________________________
          __  ____/__    |_  / / /   __  ___/_  ___/__  __ \__  ____/
          _  / __ __  /| |  / / /    _____ \_____ \__  /_/ /_  /_
          / /_/ / _  ___ / /_/ /     ____/ /____/ /_  _, _/_  __/
          \____/  /_/  |_\____/      /____/ /____/ /_/ |_| /_/




Usage: For Using directly where subdomains will be found using Assetfinder
      ./ssrf.sh -d domain.com
      ./ssrf.sh -d domain.com -o output_directory
      ./ssrf.sh -d domain.com -ap
      ./ssrf.sh -d domain.com -o output_directory -ap

Usage: For Using list of Subdomains
      ./ssrf.sh -l subdomains.txt
      ./ssrf.sh -l subdomains.txt -o output_directory
      ./ssrf.sh -l subdomains.txt -ap
      ./ssrf.sh -l subdomains.txt -o output_directory -ap
```
```
Options are as follows 
  -d  for direct letting assetfinder handle subdomain part
  -l  for using list of subdomains
  -o  for declaring output directory
  -ap for using parameter appending feature
```
## Credits:
Thanks @tomnomom for [Assetfinder](https://github.com/tomnomnom)!

Thanks @devanshbatham for [Drishti](https://github.com/devanshbatham/Drishti)!

Thanks @lc for [GAU](https://github.com/lc/gau)!

Thanks @hussein98d for parameter appending feature.

### TODO list

~~Integrate [ffuf](https://github.com/ffuf/ffuf) to fuzz params with burp collab url.~~

~~Add Option For User to Add there own subdoamin list.~~

## Contributors
[@iNoSec2](https://github.com/iNoSec2) for adding output option.
