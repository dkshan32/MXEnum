# MXEnum

A simple script to enumerate MX records from an email address

## Disclaimer

This repository and the data provided has been created purely for the purposes of academic research and for the development of effective security techniques and is not intended to be used to attack systems except where explicitly authorized. It is your responsibility to obey all applicable local, state and federal laws. 

Project maintainers assume no liability and are not responsible for any misuse or damage caused by the data therein.

Example Usage:
* ./MXEnum.sh -e 'gh0x0st@protonmail.com'
* ./MXEnum.sh -f ~/Desktop/bad_emails.txt
* ./MXEnum.sh -f ~/Desktop/bad_emails.txt -o ~/Desktop/results.txt
```Shell
root@kali:~# ./MXEnum.sh -e 'gh0x0st@protonmail.com'
  ____ _      ___        ___      _
 / ___| |__  / _ \__  __/ _ \ ___| |_
| |  _| '_ \| | | \ \/ / | | / __| __|
| |_| | | | | |_| |>  <| |_| \__ \ |_
 \____|_| |_|\___//_/\_\\___/|___/\__|

    >> MX Enumeration
    >> https://www.github.com/gh0x0st

[+] Email  - gh0x0st@protonmail.com
[-] Domain - protonmail.com
[-] MX Record - mail.protonmail.ch.
[-] MX Record - mailsec.protonmail.ch.

Done
```

OPTIONS:
  
   * -e   Designate an email to enumerate against
   * -f   Designate a file of emails to enumerate against
   * -o   Designate the file to save the output to
   * -h   Display this help page

   Running this script with no options will show only the help menu.
