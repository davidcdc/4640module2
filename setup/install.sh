#!/bin/bash

sudo cp selinux_config /etc/selinux/config

sudo useradd todoapp
sudo dnf install -y git
