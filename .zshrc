# Path to your oh-my-zsh configuration.
export ZSH=$HOME/config/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="illenseer"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew forklift git git-extras gitfast jira lol osx pip python vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Load zmv
autoload zmv

# custom PATH
if [[ `uname` == "Darwin" ]]; then
    # system-wide environment settings for zsh(1)
    if [ -x /usr/libexec/path_helper ]; then
        eval `/usr/libexec/path_helper -s`
    fi

    if [[ `id -un` == "nils" ]]; then
        export PATH=$PATH:$HOME/.local/bin:$HOME/Applications:$HOME/Applications/clasp/Contents/MacOS:$HOME/Library/Python/2.7/bin
    fi
fi

# del key
[[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char

# 256 color enabled terminal
if [ "$TERM" = "xterm" ]; then
    export TERM=xterm-256color
fi

# disable virtualenv prompt, because it is integrated into the zsh theme.
#export VIRTUAL_ENV_DISABLE_PROMPT=true

# Ignore duplicates in history
setopt hist_ignore_all_dups

# search up/down
bindkey "^[[A" 'history-beginning-search-backward'
bindkey "^[[B" 'history-beginning-search-forward'

# word forward/backward
bindkey '[C' forward-word
bindkey '[D' backward-word
bindkey '3C' forward-word
bindkey '3D' backward-word

# aliases
alias la="ls -a"
alias lla="ls -al"
alias rm="rm -i"
alias sed="/usr/local/bin/gsed"
alias mc="mc -d"

# brew aliases
alias brew='nocorrect brew'
alias b='brew'
alias bu='brew update'
alias bf='brew upgrade'
alias buf='brew update;brew upgrade'
alias bs='brew search'
alias bi='brew install'
alias bp='brew uninstall'
alias bl='brew list -1'

# vagrant aliases
alias v='vagrant'

# git aliases
unalias d
alias git='nocorrect git'
alias ga='git add'
alias gap='git add -p'
alias gu='git reset HEAD --'
alias gp='git push'
alias gpa='git push --all'
alias gl='git pull'
alias lg="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar %an)%Creset' --abbrev-commit"
alias lgi="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ai %an)%Creset' --abbrev-commit"
alias s='git status -sb'
alias gs='git status -sb'
alias gst='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias d='git diff'
alias dm='git diff master'
alias ds='git diff --staged'
alias dt='git difftool'
alias mt='git mergetool'
alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gm='git merge'
alias gmd='git merge develop'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gre='git remote -v'
alias gra='git remote add'
alias grr='git remote rm'
alias grs='git remote set-url'
alias gr='git rebase'
alias grm='git rebase master'
alias gcl='git clone'
alias st='git stash'
alias stp='git stash pop'
alias gsp='git sweep preview'
alias gsc='git sweep cleanup'

# add REPORTTIME for task longer than 10s
export REPORTTIME=10

[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source $HOME/Library/Python/2.7/bin/virtualenvwrapper.sh
