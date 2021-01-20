#!/bin/bash
git clone https://artemiszuk:mygithub004@github.com/artemiszuk/atmb-pro
cd atmb-pro
nodeenv env
. env/bin/activate
npm install
tsc
bash aria.sh
npm start
