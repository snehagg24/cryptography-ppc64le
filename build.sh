#!/bin/bash

git clone https://github.com/pyca/cryptography.git
cd ./cryptography/
export VERSION=$1
git checkout tags/$VERSION

python3 -m venv cryptography-venv
pip3 install --upgrade pip
pip3 install --editable .

pip3 install --requirement dev-requirements.txt
python3 ./setup.py build
python3 ./setup.py bdist_wheel
