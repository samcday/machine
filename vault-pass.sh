#!/bin/bash
password=$(secret-tool lookup ansible-vault samcday/machine)

if [[ -z "${password}" ]]; then
	password=$(zenity --password)
	if [[ -z "${password}" ]]; then
		exit 1
	fi
	echo -n $password | secret-tool store --label='ansible-vault/samcday/machine' ansible-vault samcday/machine
fi

echo $password
