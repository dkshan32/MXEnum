#!/bin/bash

usage()
{
header
cat << "EOF"
   OPTIONS:
   -e    Designate an email to enumerate against
   -f    Designate a file of emails to enumerate against
   -o    Designate the file to save the output to
   -h    Display this help page

   Running this script with no options will show only the help menu.

EOF
}

header()
{
cat << "EOF"
  ____ _      ___        ___      _   
 / ___| |__  / _ \__  __/ _ \ ___| |_ 
| |  _| '_ \| | | \ \/ / | | / __| __|
| |_| | | | | |_| |>  <| |_| \__ \ |_ 
 \____|_| |_|\___//_/\_\\___/|___/\__|
   
    >> MX Enumeration
    >> https://www.github.com/gh0x0st

EOF
}

enum_email()
{
    if [ $email ]
    then
        domain=$(echo $email | awk -F @ '{print $2}')
        echo "[+] Email  - $email"
        echo "[-] Domain - $domain"
        dig $domain MX +short | awk '{print "[-] MX Record -",$2}'
        echo ""
    fi
}

enum_list()
{
    if [ $file ]
    then
        for i in $(cat $file)
        do
            domain=$(echo $i | awk -F @ '{print $2}')
            echo "[+] Email  - $i"
            echo "[-] Domain - $domain"
            dig $domain MX +short | awk '{print "[-] MX Record -", $2}'
	    echo ""
        done
    fi
}

footer()
{
    echo 'Done'
}

run()
{
    header
    enum_email
    enum_list
    footer
}

if [[ $# -eq 0 ]]
then
    usage
    exit 0
fi

while getopts ":h?e:f:o:" option; do
 case "${option}" in
    o) output=${OPTARG};;
    f) file=${OPTARG};;
    e) email=${OPTARG};;
    h | ?) usage; exit;;
 esac
done

run | tee -a $output 2> /dev/null

