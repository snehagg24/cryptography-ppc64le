#!/bin/bash

git clone https://github.com/pyca/cryptography.git
cd ./cryptography/
git checkout tags/$(git describe --tags --abbrev=0)

python3 -m venv cryptography-venv
pip3 install --upgrade pip
pip3 install --editable .
pip3 install wheel
pip3 install setuptools_rust

sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) -y
source ~/.bashrc

pip3 install --requirement dev-requirements.txt
python3 ./setup.py build
python3 ./setup.py bdist_wheel
