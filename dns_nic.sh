#!/bin/bash

# This script checks if the nameservers for the domain "garrahan.gov.ar" are correctly delegated.
# It queries the DNS server at NIC Argentina

domain_name="garrahan.gov.ar"
dns=1.1.1.1

for list in $(dig @"$dns" "$domain_name"); do
    if [[ "$list" == *"ns1.garrahan.gov.ar"* ]]; then
        echo "Found nameserver/s: $list"
        found=1
    fi
done

if [[ -z "$found" ]]; then
    
        echo "Delegated nameservers not found for $domain_name"
      
fi


