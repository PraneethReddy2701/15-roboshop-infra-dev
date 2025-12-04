#!/bin/bash

dnf install ansible -y
ansible-pull -U https://github.com/PraneethReddy2701/17-roboshop-terraform-anisble-roles.git -e component=$1 main.yaml