set fish_greeting ""
set fish_user_paths ~/.local/bin/

set fish_color_command white --bold

# Reduce ESC delay to avoid shell command opening in editor
set -g fish_escape_delay_ms 10

set -gx PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH
set -gx EDITOR "nvim"

# Set LANG and LC_ALL
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

set -gx LSCOLORS "gxfxcxdxbxegedabagacad"

# openssl for compiling
set -gx LDFLAGS "-L/opt/homebrew/opt/openssl@3/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/openssl@3/include"

# Python CA certs
set -gx SSL_CERT_FILE "/opt/homebrew/etc/openssl@3/cert.pem"
set -gx REQUESTS_CA_BUNDLE "/opt/homebrew/etc/openssl@3/cert.pem"

#set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/sbin" $fish_user_paths

# Treat unrecognized command-line options as warning
set -x ARCHFLAGS "-Wno-error=unused-command-line-argument-hard-error-in-future"

# Helper functions
function collapse; sed -e 's/  */ /g'; end
function cuts; cut -d' ' $argv; end
function psg -d "Grep for a running process, returning its PID and full string"
    ps auxww | grep -i --color=always $argv | grep -v grep | collapse | cuts -f 2,11-
end

# git aliases
abbr g 'git'
abbr ga 'git add'
abbr gap 'git add -p'
abbr gu 'git reset HEAD --'
abbr gp 'git push'
abbr gpa 'git push --all'
abbr gl 'git pull'
abbr lg  lazygit
abbr lgi "git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ai %an)%Creset' --abbrev-commit"
abbr lgp "git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar %an)%Creset' --abbrev-commit"
abbr s 'git status -sb'
abbr gs 'git status -sb'
abbr gst 'git status'
abbr gd 'git diff'
abbr gds 'git diff --staged'
abbr d 'git diff'
abbr dm 'git diff main'
abbr ds 'git diff --staged'
abbr dt 'git difftool'
abbr mt 'git mergetool'
abbr gc 'git commit -v'
abbr gca 'git commit -v --amend'
abbr gm 'git merge'
abbr gb 'git branch'
abbr gba 'git branch -a'
abbr gco 'git checkout'
abbr gcm 'git checkout main'
abbr gcd 'git checkout develop'
abbr gre 'git remote -v'
abbr gr 'git rebase'
abbr grm 'git rebase main'
abbr gcl 'git clone'
abbr st 'git stash'
abbr stp 'git stash pop'

# brew aliases
abbr b 'brew'
abbr bu 'brew update'
abbr bf 'brew upgrade --greedy'
function buf; brew update; brew upgrade --greedy; end
abbr bs 'brew search'
abbr bi 'brew install'
abbr bp 'brew uninstall'
abbr bl 'brew list -1'

# asdf aliases
alias reshim 'rm -f ~/.asdf/shims/*; asdf reshim'

# GNU userland
alias sed 'gsed'
alias find 'gfind'
alias grep 'ggrep'
alias awk 'gawk'
alias tar 'gtar'

# helpful aliases
alias rm 'rm -i'
alias mc 'env LC_ALL=C mc -d'

# zoxide
alias j 'cd'

# Leader (,) aliases
function  ,ud; cd ~/.emacs.d; git pull; cd -; buf; end
abbr ,t "tmux new -s nils -A"
abbr ,z "zellij attach nils --create"
abbr ,ek "$EDITOR ~/.ssh/known_hosts"
abbr ,es "$EDITOR ~/.ssh/config"
abbr ,ef "$EDITOR ~/.config/fish/config.fish"
abbr ,sf "source ~/.config/fish/config.fish"
abbr ,ep "$EDITOR ~/.pip/pip.conf"
abbr ,vt "vf tmp"
abbr ,va "vf activate"
abbr ,vd "vf deactivate"
abbr ,ew "$EDITOR ~/.config/wezterm/wezterm.lua"

# just/make
abbr ,ji "just init"
abbr ,jf "just fresh"
abbr ,ju "just update"
abbr ,jc "just clean"
abbr ,jl "just lint"
abbr ,jt "just typing"
abbr ,jd "just deploy"
abbr ,md "make deploy"

# Ansible
set -gx VRMD_ANSIBLE_DIR "/Users/nils/work/repos/ansible"

# Consul/Vault/Nomad
set -gx VAULT_ADDR "https://active.vault.service.scaleup.consul:8200"
set -gx NOMAD_ADDR "https://nomad.service.consul:4646"
alias ,ct 'read -gsP "Consul token: " CONSUL_HTTP_TOKEN; set -gx CONSUL_HTTP_TOKEN $CONSUL_HTTP_TOKEN'
alias ,vt 'read -gsP "Vault token: " VAULT_TOKEN; set -gx VAULT_TOKEN $VAULT_TOKEN'
alias ,nt 'read -gsP "Nomad token: " NOMAD_TOKEN; set -gx NOMAD_TOKEN $NOMAD_TOKEN'

# Add Database tools to path
fish_add_path /opt/homebrew/opt/mysql-client/bin
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin

# HELPER
# brew
eval (/opt/homebrew/bin/brew shellenv)

# add asdf
source (brew --prefix asdf)/libexec/asdf.fish

# direnv
eval (direnv hook fish)

# starship prompt
starship init fish | source

# zoxide cd/z/j replacement
zoxide init fish --cmd cd | source

# fuzzy finder
# Integration is installed automatically by Homebrew
# Search dot files/dirs except .git.
set -x FZF_DEFAULT_COMMAND 'fd --hidden -E .git'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_ALT_C_COMMAND "fd -t d ."
fzf --fish | source
