#!/bin/bash

# This script checks if the nameservers for the domain "XXXXX" are correctly delegated.
# It queries the DNS server at NIC 

domain_name="xxxxxx"
dns=1.1.1.1

for list in $(dig @"$dns" "$domain_name"); do
    if [[ "$list" == *"ns1.xxxxxxxx"* ]]; then #modify with delegated server/s for the domain
        echo "Found nameserver/s: $list"
        found=1
    fi
done

if [[ -z "$found" ]]; then
    
        echo "Delegated nameservers not found for $domain_name"
      
fi


