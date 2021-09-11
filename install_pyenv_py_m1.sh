#! /bin/zsh
# Python installer script for mac M1.
# On M1 we need to export ENV when installing python to use pandas.

# https://gokugetsu.plala.jp/%E3%80%90pandas%E3%80%91userwarning-could-not-import-the-lzma-module-%E3%81%8C%E7%99%BA%E7%94%9F%E3%81%99%E3%82%8B/
# https://www.notion.so/M1-mac-Python-667ad0e172244aeabf94038cf558a7f5#6028ccfd33bd4407a6e39a9c6e339f7d

function show_usage() {
  echo "Usage: $0 <Python version>"
}

if [ $# -ne 1 ]; then
  show_usage
  exit 1
else
  pyver=$1
fi

# pyenvのpythonを一旦アンインストール
# pyenv uninstall $1

# 下記をインストール
# brew install openssl readline sqlite3 xz zlib

# pyenvでpythonを再インストール
prefix=$(brew --prefix)
export LDFLAGS="-L$prefix/opt/xz/lib $LDFLAGS"
export CPPFLAGS="-I$prefix/opt/xz/include $CPPFLAGS"
export PKG_CONFIG_PATH="$prefix/opt/xz/lib/pkgconfig:$PKG_CONFIG_PATH"

PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $1
