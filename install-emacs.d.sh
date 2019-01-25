# in this script, build_dir and install_dir will be set
. "$(dirname $0)"/base.sh

cd $install_dir
git clone --recursive https://github.com/astropeak/emacs.d
git clone https://github.com/astropeak/myelpa
git clone https://github.com/astropeak/aspk-code-base

dotemacs=~/.emacs
if [ -f $dotemacs ]; then
    DATE=`date '+%Y%m%d_%H%M%S'`
    new_name="${dotemacs}_$DATE"
    mv $dotemacs $new_name
    echo "${dotemacs} exists, move it $new_name"
fi

# create the .emacs file
cat >$dotemacs <<EOL
(setq *no-window* t)
(package-initialize)
(load-file "${install_dir}/emacs.d/init.el")
EOL
