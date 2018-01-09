#/bin/bash

#var

read -p 'Enter your domain name: ' -e -i 'oxaka.fr' hostname
printf "domain name : ${hostname}. \n"
 
#hostname=""

# port
SMTP_PORT=25
HTTP_PORT=80
POP3_PORT=110
IMAP_PORT=143
HTTPS_PORT=443
SMTPS_PORT=465
Submission_PORT=587
IMAPS_PORT=993
POP3S_PORT=995
ManageSieve_PORT=4190

#echo "Le nombre de paramèrtes est : $#"
#echo $hostname

################ hostname
# hostnamectl set-hostname mail.$hostname # reboot needed

################ config dns
#@ 21600 IN MX 10 mail.oxaka.fr
#@ 21600 IN A 91.121.85.34
#imap 21600 IN A 91.121.85.34
#pop 21600 IN A 91.121.85.34
#smtp 21600 IN A 91.121.85.34
#mail 21600 IN A 91.121.85.34

#@ 86400 IN TXT v=spf1 a mx -all
#arc._domainkey 21600 IN TXT v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCorXuVf624dPTYwxs/hTRi2mUB4rzHoj0a8fcqLL7Mwf4AsNY3NB3sK0yKom2M9AI57aHm0SfZLtuNpgS5KBZXZrdyusszJqNaMlCgq7X2zVKWy2qbICZNd0Su8B/aw9AM932P5EoXoj3x/Gy+WvEEXpYJNJcy6w+kpYIyHyWipwIDAQAB
#dkim._domainkey 21600 IN TXT v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCorXuVf624dPTYwxs/hTRi2mUB4rzHoj0a8fcqLL7Mwf4AsNY3NB3sK0yKom2M9AI57aHm0SfZLtuNpgS5KBZXZrdyusszJqNaMlCgq7X2zVKWy2qbICZNd0Su8B/aw9AM932P5EoXoj3x/Gy+WvEEXpYJNJcy6w+kpYIyHyWipwIDAQAB
#_dmarc 86400 IN TXT v=DMARC1; p=none; sp=reject

########################################################################################################

################ /etc/hosts
#127.0.0.1 localhost $hostname imap.$hostname smtp.$hostname pop3.$hostname mail.$hostname 
#####SSL : lets encrypt, custom and self-signed certificates support 
#apt-get install letsencrypt
#letsencrypt certonly --standalone -d oxaka.fr
##### mariadb
##### php7.0
##### Postfix : a full set smtp email server
#/etc/postfix/main.cf
#myhostname = mail.oxaka.fr
#mydomain = oxaka.fr
#mydestination = $myhostname, localhost.$mydomain, $mydomain

#mail_spool_directory = /var/spool/mail

#mynetworks = 127.0.0.0/8, 192.168.0.0/24
#inet_protocols = ipv4
##### Dovecot : secure imap and pop3 email server
##### Rspamd : anti-spam filter with SPF, DKIM, DMARC, ARC, ratelimit and greylisting capabilities
#apt-get install rspamd
#rspamadm dkim_keygen -s 'dkim' -d oxaka.fr
##### Clamav : antivirus with automatic updates
##### Zeyple : automatic GPG encryption of all your e-mails
##### Sieve : email filtering (vacation auto-responder, auto-forward...etc)
##### Fetchmail : fetch e-mails from external IMAP/POP3 server into local mailbox
##### Rainloop : web based email client
##### Postfixadmin : web based administration interface
##### Unbound: recursive caching DNS resolver with DNSSEC support
##### NSD : authoritative DNS server with DNSSEC support
##### Nginx : web server with HTTP/2 and TLS 1.3 (DRAFT), statically linked against BoringSSL
##### Supporting multiple virtual domains over MySQL backend