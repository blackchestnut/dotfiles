# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export NODE_PATH=/usr/local/lib/node_modules

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby bundler capistrano gem osx zeus rvm ssh-agent rake brew command-not-found compleat composer cp history history-substring-search git-remote-branch git git-flow git-extras github pow)

HISTSIZE=100000
HISTFILESIZE=200000
TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

#-----------------------------------------------------------------------------------------
# Environment variables
#-----------------------------------------------------------------------------------------

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH=$HOME/go # Go Workspaces
export PATH=$PATH:$GOPATH/bin # Add Go bins to PATH for installed golang-programms
export PATH="$HOME/.rbenv/bin:$PATH" # Add rbenv path.
export BUNDLER_EDITOR='mvim' # For $ bundle open gem_name
source ~/.environments

#-----------------------------------------------------------------------------------------
# Aliases, cd ~/my_projects
#-----------------------------------------------------------------------------------------

RALSPROJECTS="~/projects"
alias my="cd $RALSPROJECTS/mybudget"
alias shi="cd $RALSPROJECTS/shikimori.org/shikimori"
alias vi="cd $RALSPROJECTS/vimocean"
alias ag="cd $RALSPROJECTS/agileseason"
alias tt="cd $RALSPROJECTS/trantoria"
alias na="cd $RALSPROJECTS/nala"
alias pu="cd $RALSPROJECTS/pumba"
alias ma="cd $RALSPROJECTS/market"
alias mp="cd $RALSPROJECTS/market_parser"
alias ch="cd $RALSPROJECTS/chef-my/"
alias mygo="cd $GOPATH/src/github.com/blackchestnut"
cd_projects() {
  cd ~/projects/$1
}
alias pr=cd_projects

#-----------------------------------------------------------------------------------------
# bash / zsh
#-----------------------------------------------------------------------------------------
alias update='. ~/.zshrc'

#-----------------------------------------------------------------------------------------
# ssh
#-----------------------------------------------------------------------------------------

alias linode_0='ssh deploy@178.79.173.247'
alias linode_agile='ssh deploy@173.255.204.93'
alias shikimori='ssh devops@78.46.50.20'

#-----------------------------------------------------------------------------------------
# Git
#-----------------------------------------------------------------------------------------

alias g='git'
alias gs='git status'
alias gd='git diff HEAD --color'
alias gd1='git diff HEAD~1 --color'
alias gd2='git diff HEAD~2 --color'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s - %C(bold blue)%an%Creset, %Cgreen%cr' --abbrev-commit"
alias gu='git-up' # https://github.com/aanand/git-up
alias gp='git push'
alias gb="git checkout -b $1"
alias gch="git checkout $1"
alias gaa='git add -A'
alias ga="git add $1"
alias gc="git commit -m $1"
alias gm='git mergetool'
alias master='git checkout master && gu'
alias develop='git checkout develop && gu'

#-----------------------------------------------------------------------------------------
# Rails
#-----------------------------------------------------------------------------------------

alias r='rails'
alias rs='rails server'
alias rc='rails console'
alias rdb='rails dbconsole'
alias migrate='rake db:migrate && RAILS_ENV=test rake db:migrate'
alias rollback='rake db:rollback && rake RAILS_ENV=test db:rollback'
alias redo="rake db:migrate:redo VERSION=$1 && RAILS_ENV=test rake db:migrate:redo VERSION=$1"
alias pdeploy='cap production deploy'
alias sdeploy='cap staging deploy'
alias deploy=pdeploy
alias dp=pdeploy
alias ds=sdeploy

#-----------------------------------------------------------------------------------------
# Process
#-----------------------------------------------------------------------------------------

alias psg="ps aux|grep $1"

port_lock() {
  lsof -i tcp:$1
}
alias plock=port_lock

#-----------------------------------------------------------------------------------------
# ls
#-----------------------------------------------------------------------------------------

alias ll='ls -la'
alias l='ls -a'

#-----------------------------------------------------------------------------------------
# Files
#-----------------------------------------------------------------------------------------

find_files() {
  find . -type f \( -name "*.rb" -or -name "*.erb" -or -name "*.rss" -or -name "*.xml" -or -name "*.slim" -or -name "*.haml" -or -name "*.js" -or -name "*.coffee" -or -name "*.ejs" -or -name "*.jst" -or -name "*.eco" -or -name "*.css" -or -name "*.scss" -or -name "*.yml" -or -name "*.vim" -or -name "*.rabl" -or -name "*.builder"  -or -name "*.txt" \)  -exec grep -l "$1" {} \;
}
alias ff=find_files

fgrep_all() {
  fgrep -i -r $1 **/ | grep --color $1
}
fgrep_ext() {
  fgrep -i -r $2 **/*.$1 | grep --color $2
}
fgrep_r() {
  fgrep -i -r $1 **/*.{rb,slim,sass,coffee,yml} | grep --color $1
}
alias f=fgrep_r
alias fx=fgrep_ext
alias fa=fgrep_all

#-----------------------------------------------------------------------------------------
# History
#-----------------------------------------------------------------------------------------

alias hg="history | grep $1"
alias gh=hg

#-----------------------------------------------------------------------------------------
# Startup
#-----------------------------------------------------------------------------------------
eval "$(rbenv init -)"
