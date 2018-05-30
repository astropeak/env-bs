# This script will install the latest version of git
if [ -z "$1" ]; then
    echo "Please call '$0 INSTALL_DIR' to run this command!\n"
    exit 1
fi


abspath (){
   echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
}

# install_dir=$(abspath $1)
install_dir=`abspath $1`
echo "install directory: $install_dir"

cd $install_dir

git clone https://github.com/git/git

cd git
make configure
./configure --prefix=`pwd`/git-install
make all doc info
sudo make install install-doc install-html install-info