# This script will install the latest version of git

# in this script, build_dir and install_dir will be set
. "$(dirname $0)"/base.sh

cd $build_dir
git clone https://github.com/git/git
cd git
make configure
./configure --prefix=$install_dir
make all doc info
make install install-doc install-html install-info