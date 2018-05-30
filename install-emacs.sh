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

wget http://mirrors.ustc.edu.cn/gnu/emacs/emacs-25.3.tar.xz

tar xfJ emacs-25.3.tar.xz
cd emacs-25.3

make configure
./configure --prefix=`pwd`/emacs-install
make
make install