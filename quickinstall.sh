#!/data/data/com.termux/files/usr/bin/bash

export REPO_URL=https://github.com/SHLEM666/android-sagemath.git
export BRANCH=main

yes | pkg update
yes | pkg install git

git clone "${REPO_URL}"
cd android-sagemath
git checkout "${BRANCH}"

./install.sh
