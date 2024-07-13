#!/bin/bash

openssl req -x509 -nodes -out $CRT_NGINX -keyout $KEY_NGINX -subj $SUB_NGINX

exec nginx -g 'daemon off;'