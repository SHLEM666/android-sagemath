#!/data/data/com.termux/files/usr/bin/bash

# install necessary packages
yes | pkg update
yes | pkg install proot-distro expect

# if config.env does not exist
if [ ! -f "config.env" ]; then
    # get the default config file
    cp config.sample config.env
fi

source config.env

# if $SAGE_DISTR_NAME is empty
if [ -z "${SAGE_DISTR_NAME}" ]; then
    echo "A distribution name must not be empty"
    exit
fi

# create a separate distribution for sagemath
cp $PREFIX/etc/proot-distro/debian.sh $PREFIX/etc/proot-distro/$SAGE_DISTR_NAME.sh
proot-distro install $SAGE_DISTR_NAME

expect -f install.expect
