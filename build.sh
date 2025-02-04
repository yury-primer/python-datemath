#!/bin/bash

# builds our packages for pypi

source env/bin/activate
pip2.7 install -r requirements-2.txt
pip3.7 install -r requirements-3.txt

echo "Removing any previous build dir..."
rm -rf build
echo "Removing any previous dist dir..."
rm -rf dist

echo "Building for python 2.7..."
python2.7 setup.py sdist bdist_wheel
echo "Building for python 3.7+..."
python3.7 setup.py sdist bdist_wheel

echo "Running twine upload..."
twine upload dist/*
