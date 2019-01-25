# in this script, build_dir and install_dir will be set
. "$(dirname $0)"/base.sh

cd $build_dir
# https://pip.pypa.io/en/stable/installing/
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
