abspath (){
    echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
}

root_dir=
build_dir=
install_dir=
# user=`ps -o user= -p $$ | awk '{print $1}'`
# user=`id -u -n`
# current user name, without regarding sudo. All above not work
# ref: https://stackoverflow.com/questions/3522341/identify-user-in-a-bash-script-called-by-sudo
user=`who am i | awk '{print $1}'`
root_dir=/home/${user}/software
if [ ! -z "$1" ]; then
    root_dir=$1
    # echo "Please call '$0 ROOT_DIR' to run this command!\n"
    # exit 1
fi

root_dir=`abspath $root_dir`
build_dir=$root_dir/build
install_dir=$root_dir/install

echo "build directory: $build_dir"
echo "install directory: $install_dir"

if [ ! -d $build_dir ]; then
    echo "Making build directory $build_dir ..."
    mkdir -p $build_dir
fi

if [ ! -d $install_dir ]; then
    echo "Making install directory: ${install_dir} ..."
    mkdir -p $install_dir
fi


