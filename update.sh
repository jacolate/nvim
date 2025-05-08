#!/bin/bash

cp -R /Users/oreok/.config/nvim/ .
git add .
read -p "Enter commit msg: " msg
git commit -m "$msg"
git push origin main

