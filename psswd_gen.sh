#!/bin/bash

# Function to generate a random password
gen_password() {
    # Length of password (random between 8 and 12)
    length=$((RANDOM % 5 + 8))

     password=$(tr -dc 'A-Za-z0-9!@#$%^&*_+-=|;:,.<>?' < /dev/urandom | head -c "$length")

    # Ensure password contains at least:
    # 1 uppercase, 1 lowercase, 1 special char, 1 number
    while [[ ! "$password" =~ [A-Z] ||
             ! "$password" =~ [a-z] ||
             ! "$password" =~ [0-9] ||
             ! "$password" =~ [[:punct:]] ]]; do # matches all puncutation chars
        password=$(tr -dc 'A-Za-z0-9!@#$%^&*_+-=|;:,.<>?' < /dev/urandom | head -c "$length")
    done
    
    echo "$password"
}

# Generate & print the password
gen_password
