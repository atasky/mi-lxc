#!/bin/bash
# Mail client template
set -e
if [ -z $MILXCGUARD ] ; then exit 1; fi
DIR=`dirname $0`
cd `dirname $0`

# $domain, $mailname, $password

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y claws-mail

cp -ar claws-mail /home/debian/.claws-mail
chown -R debian:debian /home/debian/.claws-mail

sed -i -e "s/\$domainname/$domain/" /home/debian/.claws-mail/accountrc
sed -i -e "s/\$mailname/$mailname/" /home/debian/.claws-mail/accountrc

sed -i -e "s/\$domainname/$domain/" /home/debian/.claws-mail/folderlist.xml
sed -i -e "s/\$mailname/$mailname/" /home/debian/.claws-mail/folderlist.xml

if [ "$password" = "hacker" ] ; then
  pass="AiU2DSaWBrjobby90aPWqUKtfV6bnpueNcmHKo5+59gXxh9Y1nrxFNpzOaXa/kKdoUEuyoMzCnwK9eXCS9I96u8mDzYQMall1RkJNb8hWxXOiIOI7kp4ivU+bFqRCzBBadtwdFRtvpDiQYhCIb0di3ltNLE017eoMi6sRrd23PY="
elif [ "$password" = "commercial" ] ; then
  pass="jcFj1Y73ajScjfy2OL6ld76+Xb/pM28UWQJIgBKbIS8X5vRnSRUL7KBExMhpkAxBpunE10kuWwu0ojXxn5Pey1BJ7EnNnEHi0jsc+dM5RkBlC3NkwkdOetkzMvahDkHZ6qfp7iUGhEBLSq+DlR2ePzjuDTUAlVu14AADfUaNUe8="
else
  pass="EncryptedPassword"
fi

sed -i -e "s;\$password;$pass;" /home/debian/.claws-mail/passwordstorerc
# AiU2DSaWBrjobby90aPWqUKtfV6bnpueNcmHKo5+59gXxh9Y1nrxFNpzOaXa/kKdoUEuyoMzCnwK9eXCS9I96u8mDzYQMall1RkJNb8hWxXOiIOI7kp4ivU+bFqRCzBBadtwdFRtvpDiQYhCIb0di3ltNLE017eoMi6sRrd23PY=
