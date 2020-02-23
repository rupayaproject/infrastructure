#!/bin/bash

echo "Please fill the following required values:"

echo -e "\n[ netstats ]\n"

echo "New Netstats websocket secret ('WS_SECRET'): "
unset input && read -s input \
; echo $input | docker secret create netstats_ws_secret -

echo -e "\n[ tomoscan ]\n"

echo "Existing Sendgrid api key: "
unset input && read -s input \
; echo $input | docker secret create sendgrid_api_key -
echo "Existing Recaptcha secret: "
unset input && read -s input \
; echo $input | docker secret create re_captcha_secret -
echo "Existing jwt secret: "
unset input && read -s input \
; echo $input | docker secret create scan_jwt_secret -
echo "Existing app secret: "
unset input && read -s input \
; echo $input | docker secret create scan_app_secret -
echo "Existing slack webhook url: "
unset input && read -s input \
; echo $input | docker secret create slack_webhook_url -

echo -e "\n[ rupaya ]\n"

echo "New account password for node 'rupaya01': "
unset input && read -s input \
; echo $input | docker secret create rupaya_password_rupaya01 -
echo "Existing private key for node 'rupaya01': "
unset input && read -s input \
; echo $input | docker secret create rupaya_pk_rupaya01 -
echo "New account password for node 'rupaya02': "
unset input && read -s input \
; echo $input | docker secret create rupaya_password_rupaya02 -
echo "Existing private key for node 'rupaya02': "
unset input && read -s input \
; echo $input | docker secret create rupaya_pk_rupaya02 -
echo "New account password for node 'rupaya03': "
unset input && read -s input \
; echo $input | docker secret create rupaya_password_rupaya03 -
echo "Existing private key for node 'rupaya03': "
unset input && read -s input \
; echo $input | docker secret create rupaya_pk_rupaya03 -

echo -e "\n[ loadbalancer ]\n"

echo "Creating internal masternode lb conf"
docker secret create nginx_conf_blockchain-proxy "./res/blockchain-proxy/nginx.conf"

clear
echo -e "\n[ review ]\n"
docker secret list
