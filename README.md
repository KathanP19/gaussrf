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
* [Anti-burl](https://github.com/tomnomnom/hacks/tree/master/anti-burl) - For check if url is live or not.

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

```bash
$ ./ssrf domain.com

```

## Credits:
Thanks @tomnomom for [Assetfinder,Anti-burl](https://github.com/tomnomnom)!

Thanks @lc for [GAU](https://github.com/lc/gau)!

### TODO list

Integrate [ffuf](https://github.com/ffuf/ffuf) to fuzz params with burp collab url.
