#!/usr/bin/env bash

apt-get -y update
apt-get -y install nginx

service nginx start