#!/bin/bash

domain_name="garrahan.gov.ar"
dns=1.1.1.1

for list in $(dig @"$dns" "$domain_name"); do
    if [[ "$list" == *"ns1.garrahan.gov.ar"* ]]; then
        echo "Delegación existente: $list"
        exit 0
    fi
done

echo "ns1.garrahan.gov.ar no delegado."
exit 2



