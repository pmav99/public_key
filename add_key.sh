#!/bin/sh

# My public key
KEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkOSIir77pSQnarOPWJbsLeB0Aw/EDp4MCDyfgIyCdzAnELXQfW88N3bh5MfDXc4Fz7XDpCsa1z106Q6p2AqK8su/3AYlxFZwDHLPf4sDPDmdvEgcmFGSi74CpP27gmu/WuWUEIxsSA1m+GQXFzROIB1qtIZ0+ZKAf/XOr5Z35a6ZFvawocl5X6M7a7cLM7Y1Ud9YA6CDAITBL+UB4IfBCHKjnfxhzGv3SR9F06FATVfYiQxpXDPMW7ZJZwGU58+BoCLpFgsL7wwD7HhhrDq6rAtvhxtdNKFYvv38Y9OZqG/X3ZACfQUhCPdfDqbMJMjH3s9SIUVWw8B+BLp/s8YeZ faramir@archlinux'

# Determine key path, warning eval = evil
HOME=$(eval echo ~${SUDO_USER})
KEYCHAIN="$HOME/.ssh/authorized_keys"

# Append public key to keychain
echo $KEY >> $KEYCHAIN
if [ $? -ne 0 ]; then
    echo "Could not append key to $KEYCHAIN"
    exit 1
fi

echo "Key added!"
