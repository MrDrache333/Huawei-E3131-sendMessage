#!/bin/bash

NUMBER=$1
MESSAGE=$2

LENGTH=${#MESSAGE}
TIME=$(date +"%Y-%m-%d %T")
TOKEN=$(curl -v 'http://192.168.8.1/api/webserver/token' | sed -n 's:.*<token>\(.*\)</token>.*:\1:p')

SMS="<?xml version="1.0" encoding="UTF-8"?><request><Index>-1</Index><Phones><Phone>$NUMBER</Phone></Phones><Sca></Sca><Content>$MESSAGE</Content><Length>$LENGTH</Length><Reserved>1</Reserved><Date>$TIME</Date></request>"

curl 'http://192.168.8.1/api/sms/send-sms' -H "__RequestVerificationToken: $TOKEN" --data "$SMS" --compressed
