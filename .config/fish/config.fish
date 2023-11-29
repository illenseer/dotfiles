set fish_greeting ""
set fish_user_paths ~/.local/bin/

set fish_color_command white --bold

# Reduce ESC delay to avoid shell command opening in editor
set -g fish_escape_delay_ms 10

set -gx PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH
set -gx EDITOR "vim"

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

# ALIASES
# git aliases
alias g 'git'
alias ga 'git add'
alias gap 'git add -p'
alias gu 'git reset HEAD --'
alias gp 'git push'
alias gpa 'git push --all'
alias gl 'git pull'
alias lg  lazygit
alias lgi "git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ai %an)%Creset' --abbrev-commit"
alias lgp "git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar %an)%Creset' --abbrev-commit"
alias s 'git status -sb'
alias gs 'git status -sb'
alias gst 'git status'
alias gd 'git diff'
alias gds 'git diff --staged'
alias d 'git diff'
alias dm 'git diff main'
alias ds 'git diff --staged'
alias dt 'git difftool'
alias mt 'git mergetool'
alias gc 'git commit -v'
alias gca 'git commit -v --amend'
alias gm 'git merge'
alias gmd 'git merge develop'
alias gb 'git branch'
alias gba 'git branch -a'
alias gco 'git checkout'
alias gcm 'git checkout main'
alias gcd 'git checkout develop'
alias gre 'git remote -v'
alias gra 'git remote add'
alias grr 'git remote rm'
alias grs 'git remote set-url'
alias gr 'git rebase'
alias grm 'git rebase main'
alias gcl 'git clone'
alias st 'git stash'
alias stp 'git stash pop'
alias gsp 'git sweep preview'
alias gsc 'git sweep cleanup'

# brew aliases
alias b 'brew'
alias bu 'brew update'
alias bf 'brew upgrade --greedy'
alias buf 'brew update;brew upgrade --greedy'
alias bs 'brew search'
alias bi 'brew install'
alias bp 'brew uninstall'
alias bl 'brew list -1'

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

# Z alias
alias j 'z'

# Leader (,) aliases
alias ,ud 'cd ~/.emacs.d; git pull; cd; buf'
alias ,jd 'just deploy'
alias ,ju 'just update'
alias ,md 'make deploy'
alias ,t 'tmux new -s nils -A'
alias ,ek 'vi ~/.ssh/known_hosts'
alias ,es 'vi ~/.ssh/config'
alias ,ef 'vi ~/.config/fish/config.fish'
alias ,ep 'vi ~/.pip/pip.conf'
alias ,vt 'vf tmp'
alias ,va 'vf activate'
alias ,vd 'vf deactivate'

# Ansible
set -gx VRMD_ANSIBLE_DIR "/Users/nils/work/repos/ansible"

# Consul/Vault/Nomad
set -gx VAULT_ADDR "https://active.vault.service.scaleup.consul:8200"
set -gx NOMAD_ADDR "https://nomad.service.consul:4646"
alias ct 'read -gsP "Consul token: " CONSUL_HTTP_TOKEN; set -gx CONSUL_HTTP_TOKEN $CONSUL_HTTP_TOKEN'
alias vt 'read -gsP "Vault token: " VAULT_TOKEN; set -gx VAULT_TOKEN $VAULT_TOKEN'
alias nt 'read -gsP "Nomad token: " NOMAD_TOKEN; set -gx NOMAD_TOKEN $NOMAD_TOKEN'

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
