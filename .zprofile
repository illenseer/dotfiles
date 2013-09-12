# language/locale settings
if [[ `id -u` == 0 ]]; then
    LANG="en_US.UTF-8"
    LANGUAGE="en_US.UTF-8"
    LC_ALL="en_US.UTF-8"
else
    LANG="de_DE.UTF-8"
    LANGUAGE="de_DE.UTF-8"
    LC_ALL="de_DE.UTF-8"
fi
export LANG LANGUAGE LC_ALL

# editor settings
EDITOR="/usr/local/bin/vim"
ALTERNATE_EDITOR="/usr/bin/emacs"
export EDITOR ALTERNATE_EDITOR
