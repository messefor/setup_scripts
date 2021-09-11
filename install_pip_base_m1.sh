#! /bin/zsh
# Snippet for installing data analysis libraries into mac M1.

pip install --upgrade pip

# numpy
# https://www.notion.so/M1-mac-Python-667ad0e172244aeabf94038cf558a7f5#cec611b02b2f48829f3c9f0c03e58a39
# brew install openblas
pip install cython
OPENBLAS="$(brew --prefix openblas)" pip install numpy --no-use-pep517

# scipy
# https://www.notion.so/M1-mac-Python-667ad0e172244aeabf94038cf558a7f5#d5b232a6b966417c958b4a95b4c8e523
# brew install openblas
pip install cython pybind11 pythran numpy
OPENBLAS=$(brew --prefix openblas) CFLAGS="-falign-functions=8 ${CFLAGS}" pip install --no-use-pep517 scipy

pip install jupyterlab
pip install pandas matplotlib
pip install pyyaml toml
