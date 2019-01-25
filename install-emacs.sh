# This script will install emacs 25.3
# the first paramter is the install dir. source code will be downloaded under 'build' dir inside the install dir, and binarys will be installed into 'install' dir under the install dir

# in this script, build_dir and install_dir will be set
. "$(dirname $0)"/base.sh


cd $build_dir
if [ ! -f "emacs-25.3.tar.xz" ]; then
    echo "download emacs soucer code ..."
    wget http://mirrors.ustc.edu.cn/gnu/emacs/emacs-25.3.tar.xz
fi

if [ ! -d "emacs-25.3" ]; then
    echo "uncompress ..."
    tar xfJ emacs-25.3.tar.xz
fi
cd emacs-25.3

make configure
./configure --prefix=$install_dir --without-x
make
make install