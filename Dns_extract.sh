#!/bin/bash

### This script is to get dns records in text file and the convert it into csv file. ###
while read -r LINE;
do   
       	host -a "$LINE" | grep -a MX
	host -a "$LINE" | grep -a NS
done < Domains > domain-extract.txt
sed -i '/ANSWER/d' domain-extract.txt
sed -i '/SOA/d' domain-extract.txt
sed 's/[[:space:]]\+/,/g' domain-extract.txt > domain-extract.csv

