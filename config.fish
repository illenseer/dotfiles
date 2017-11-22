set fish_greeting ""

set fish_user_paths ~/.local/bin/

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showcolorhints 1
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_char_dirtystate '⚡ '
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

set -gx EDITOR "vim"

set fish_color_user "yellow"
set fish_color_status "red"

set -gx LSCOLORS "gxfxcxdxbxegedabagacad"

# git aliases
alias g 'git'
alias ga 'git add'
alias gap 'git add -p'
alias gu 'git reset HEAD --'
alias gp 'git push'
alias gpa 'git push --all'
alias gl 'git pull'
alias lg "git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar %an)%Creset' --abbrev-commit"
alias lgi "git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ai %an)%Creset' --abbrev-commit"
alias s 'git status -sb'
alias gs 'git status -sb'
alias gst 'git status'
alias gd 'git diff'
alias gds 'git diff --staged'
alias d 'git diff'
alias dm 'git diff master'
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
alias gcm 'git checkout master'
alias gcd 'git checkout develop'
alias gre 'git remote -v'
alias gra 'git remote add'
alias grr 'git remote rm'
alias grs 'git remote set-url'
alias gr 'git rebase'
alias grm 'git rebase master'
alias gcl 'git clone'
alias st 'git stash'
alias stp 'git stash pop'
alias gsp 'git sweep preview'
alias gsc 'git sweep cleanup'

# brew aliases
alias b 'brew'
alias bu 'brew update'
alias bf 'brew upgrade'
alias buf 'brew update;brew upgrade'
alias bs 'brew search'
alias bi 'brew install'
alias bp 'brew uninstall'
alias bl 'brew list -1'

# GNU userland
alias sed 'gsed'
alias find 'gfind'
alias grep 'ggrep'
alias tar 'gtar'

# helpful aliases
alias rm 'rm -i'
alias mc 'mc -d'
alias ek 'vi ~/.ssh/known_hosts'
alias es 'vi ~/.ssh/config'

# Treat unrecognized command-line options as warning
set -x ARCHFLAGS "-Wno-error=unused-command-line-argument-hard-error-in-future"

# Vagrant
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion
alias v 'vagrant'

alias ef "vim ~/.config/fish/config.fish"
function collapse; sed -e 's/  */ /g'; end
function cuts; cut -d' ' $argv; end
function psg -d "Grep for a running process, returning its PID and full string"
    ps auxww | grep -i --color=always $argv | grep -v grep | collapse | cuts -f 2,11-
end

# z
. ~/.config/fish/vendor/z-fish/z.fish
alias j z

# Virtualfish
eval (/Users/nils/.pyenv/shims/python -m virtualfish compat_aliases)
alias va 'vf activate'
alias vd 'deactivate'

# Vault
export VAULT_ADDR=https://active.vault.service.scaleup.consul:8200
alias vt='read -giP "Vault token: " VAULT_TOKEN; export VAULT_TOKEN'

# pyenv
. (pyenv init - | psub)
