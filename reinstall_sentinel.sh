#!/bin/bash
CONFIGFOLDER='/root/.crowdcoincore'

rm -r $CONFIGFOLDER/sentinelLinux > /dev/null 2>&1
echo -e "${GREEN}do quick cleanup${NC}"
rm $CONFIGFOLDER/sentinel.log > /dev/null 2>&1


apt-get -y install python-virtualenv virtualenv >/dev/null 2>&1
cd $CONFIGFOLDER
git clone https://github.com/crowdcoinChain/sentinelLinux.git /root/.crowdcoincore/sentinelLinux >/dev/null 2>&1
cd $CONFIGFOLDER/sentinelLinux
virtualenv ./venv >/dev/null 2>&1
./venv/bin/pip install -r requirements.txt >/dev/null 2>&1


mv $CONFIGFOLDER/sentinelLinux/sentinel.conf /root/.crowdcoincore/sentinel/sentinel.OLD
touch $CONFIGFOLDER/sentinel/sentinel.conf >/dev/null 2>&1
cat << EOF > $CONFIGFOLDER/sentinel/sentinel.conf
# specify path to dash.conf or leave blank
# default is the same as DashCore
#dash_conf=/root/.crowdcoincore/crowdcoin.conf
crowd_conf=/root/.crowdcoincore/crowdcoin.conf

# valid options are mainnet, testnet (default=mainnet)
network=mainnet
#network=testnet

# database connection details
db_name=database/sentinel.db
db_driver=sqlite

EOF
