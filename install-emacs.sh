if [ -z "$1" ]; then
    echo "Please call '$0 INSTALL_DIR' to run this command!\n"
    exit 1
fi

install_dir=$1

if [ ! -d $install_dir ]; then
    mkdir -p $install_dir
    echo "Making directory: ${install_dir}"
fi

cd $install_dir
git clone --recurse-submodules https://github.com/astropeak/emacs.d
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



