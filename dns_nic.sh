#!/bin/bash

# This script checks if the nameservers for the domain "garrahan.gov.ar" are correctly delegated.
# It queries the DNS server at NIC Argentina and uses `dig` to check for the presence of the nameserver "ns1.garrahan.gov.ar".
# In case of failure, it sends an email alert to the specified address. A proper .mailrc file is required for email functionality.

domain_name="xxxxxxx"
dns=1.1.1.1
mail_to="lperalta@xxxxxxx"

for list in $(dig @"$dns" "$domain_name"); do
    if [[ "$list" == *"ns1.xxxxxxx"* ]]; then #Modify with delegated nameserver for domain
        echo "Found nameserver/s: $list"
        found=1
    fi
done

if [[ -z "$found" ]]; then
    
        echo "Delegated nameservers not found for $domain_name" | s-nail -s "DNS Alert" $mail_to

      
fi



