#!/bin/bash
git clone https://github.com/artemiszuk/aria2c-ariang
cd aria2c-ariang
if [ -f .env ]; then
    echo ".env file found, sourcing it"
	set -o allexport
	source .env
	set +o allexport
fi
mkdir downloads
export PATH="$(cat downloads)"

if [[ -n $RCLONE_CONFIG && -n $RCLONE_DESTINATION ]]; then
	echo "Rclone config detected"
	echo -e "[DRIVE]\n$RCLONE_CONFIG" > rclone.conf
	echo "on-download-stop=./delete.sh" >> aria2c.conf
	echo "on-download-complete=./on-complete.sh" >> aria2c.conf
	chmod +x delete.sh
	chmod +x on-complete.sh
fi

echo "rpc-secret=$ARIA2C_SECRET" >> aria2c.conf
aria2c --conf-path=aria2c.conf&
yarn start
