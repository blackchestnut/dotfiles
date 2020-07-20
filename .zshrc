# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/alexanderkalinichev/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ruby bundler capistrano gem osx rvm ssh-agent rake brew command-not-found compleat composer cp history history-substring-search git git-flow git-extras github)

source $ZSH/oh-my-zsh.sh

#-----------------------------------------------------------------------------------------
# Environment variables
#-----------------------------------------------------------------------------------------

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export GPG_TTY=$(tty)

export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=$HOME/go        # Go Workspaces
export PATH=$PATH:$GOPATH/bin # Add Go bins to PATH for installed golang-programms
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin
# export PATH=/usr/local/bin:$PATH
# export PATH=/usr/local/sbin:$PATH

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export ANDROID_HOME=/usr/local/share/android-sdk     # React Native for Android
export ANDROID_SDK_ROOT=ANDROID_HOME                 #
export PATH=${PATH}:${ANDROID_HOME}/tools            # - android
export PATH=${PATH}:${ANDROID_HOME}/tools/bin        # - sdkmanager and avdmanager
export PATH=${PATH}:${ANDROID_HOME}/platform-tools   # - adb (Android Debug Bridge)
export BUNDLER_EDITOR=mvim # For $ bundle open gem_name
export REACT_EDITOR=mvim
export EDITOR=mvim

# Ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following.
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
source ~/.environments

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#-----------------------------------------------------------------------------------------
# Aliases, cd ~/my_projects
#-----------------------------------------------------------------------------------------

RALSPROJECTS="~/projects"
alias my1="cd $RALSPROJECTS/mybudget/mybudget"
alias my="cd $RALSPROJECTS/mybudget/mybudget2"
alias mya="cd $RALSPROJECTS/mybudget/mybudget2-api"
alias mygo="cd $GOPATH/src/github.com/blackchestnut"
alias vi="cd $RALSPROJECTS/my/vimocean"
alias a="cd $RALSPROJECTS/agileseason/agileseason2"
alias ac="cd $RALSPROJECTS/my/agileseason2/client"
alias ad="cd $RALSPROJECTS/my/agileseason.github.io"
alias tt="cd $RALSPROJECTS/my/trantoria"
alias grin="cd $RALSPROJECTS/grin"
alias as="cd $RALSPROJECTS/grin/amazing-supplies"
alias aw="cd $RALSPROJECTS/grin/grin"
alias ass="cd $RALSPROJECTS/grin/asscraper"
alias asa="cd $RALSPROJECTS/grin/asapp"
alias ca="cd $RALSPROJECTS/cardwiz/cardwiz"
alias cad="cd $RALSPROJECTS/cardwiz/cardwiz-data"
alias caa="cd $RALSPROJECTS/cardwiz/cardwiz-algo"
alias mi="cd $RALSPROJECTS/minisklad/minisklad"
alias mia="cd $RALSPROJECTS/minisklad/minisklad-app"
alias mic="cd $RALSPROJECTS/minisklad/minisklad-chef"
alias min="cd $RALSPROJECTS/minisklad/minisklad-node"
alias minc="cd $RALSPROJECTS/minisklad/minisklad-node-chef"
cd_projects() {
  cd ~/projects/$1
}
alias pr=cd_projects

#-----------------------------------------------------------------------------------------
# bash / zsh
#-----------------------------------------------------------------------------------------

alias reload='. ~/.zshrc'
alias m='mvim -S ~/.vimrc'
alias mzsh='m ~/.zshrc'
alias mvimrc='m ~/.vim/vimrc'
alias python='/usr/local/bin/python3'
alias pip='/usr/local/bin/pip3'

#-----------------------------------------------------------------------------------------
# ssh
#-----------------------------------------------------------------------------------------

alias linode_0='ssh deploy@178.79.173.247'
alias linode_agile='ssh deploy@173.255.204.93'

#-----------------------------------------------------------------------------------------
# Git
#-----------------------------------------------------------------------------------------

alias g='git'
alias ga="git add $1"
alias gaa='git add -A'
alias gb="git checkout -b $1"
alias gc="git commit -m $1"
alias gcc="git commit --amend -m $1"
alias gch="git checkout $1"
alias gcp="git cherry-pick $1"
alias gd1='git diff HEAD~1 --color'
alias gd2='git diff HEAD~2 --color'
alias gd3='git diff HEAD~3 --color'
alias gd='git diff HEAD --color'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s - %C(bold blue)%an%Creset, %Cgreen%cr' --abbrev-commit"
alias gm='git mergetool --tool=vimdiff'
alias gp='git push'
alias grh='git reset --hard && git clean -f'
alias gs='git status'
alias gu='git fetch && git pull --rebase' # https://github.com/aanand/git-up
alias develop='git checkout develop && gu'
alias master='git checkout master && gu'
alias staging='git checkout staging && gu'
alias amsterdam='git checkout amsterdam && gu'
alias pull=gu
alias push=gp
alias ccom='git commit --amend -m'
alias misc='git add -A && git commit -m "misc"'
alias cleanup='git add -A && git commit -m "code cleanup"'

#-----------------------------------------------------------------------------------------
# Rails
#-----------------------------------------------------------------------------------------

alias r='rails'
alias rs='rails server'
alias rc='rails console'
alias rdb='rails dbconsole'
alias bi='bundle install'
alias bu='bundle update'
alias migrate='rake db:migrate && RAILS_ENV=test rake db:migrate'
alias rollback='rake db:rollback && rake RAILS_ENV=test db:rollback'
alias remigrate='rollback && migrate'
alias redo="rake db:migrate:redo VERSION=$1 && RAILS_ENV=test rake db:migrate:redo VERSION=$1"
alias pdeploy='cap production deploy'
alias sdeploy='cap staging deploy'
alias deploy=pdeploy
alias dp='./deploy.sh'
alias rake='noglob rake'

#-----------------------------------------------------------------------------------------
# Tools
#-----------------------------------------------------------------------------------------

alias ngrok='~/apps/ngrok/ngrok http 3000'

#-----------------------------------------------------------------------------------------
# React
#-----------------------------------------------------------------------------------------

alias fstart='foreman start -f Procfile.dev'
alias fs='fstart'

#-----------------------------------------------------------------------------------------
# React Native
#-----------------------------------------------------------------------------------------

alias react-native-android-release='cd android && ./gradlew assembleRelease && cd .. && cd android/app/build/outputs/apk && open .'
alias react-native-clean='watchman watch-del-all && yarn cache clean && rm -rf node_modules && rm -rf $TMPDIR/react-*  && yarn'
alias rclean='react-native-clean'
alias ipad='react-native run-ios --simulator="iPad Air"'
alias iphone='react-native run-ios --simulator="iPhone 5"'
alias yi='yarn'
alias ys='yarn start'

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

alias dirsize='du -h -d 1 | sort -r'

#-----------------------------------------------------------------------------------------
# History
#-----------------------------------------------------------------------------------------

alias hg="history | grep $1"
alias gh=hg

#-----------------------------------------------------------------------------------------
# React Native
#-----------------------------------------------------------------------------------------

# alias emulator='cd /usr/local/share/android-sdk/emulator && ./emulator'
# alias avd='emulator -avd Nexus_5X_API_23_x86_64 -gpu host -skin 1080x1920'

#-------------------------------------------------------------------------------
# tab colors
#-------------------------------------------------------------------------------
#if [[ -n "$ITERM_SESSION_ID" ]]; then
#  tab-color() {
#    echo -ne "\033]6;1;bg;red;brightness;$1\a"
#    echo -ne "\033]6;1;bg;green;brightness;$2\a"
#    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
#  }
#  tab-red() { tab-color 255 0 0 }
#  tab-green() { tab-color 0 255 0 }
#  tab-blue() { tab-color 0 0 255 }
#  tab-reset() { echo -ne "\033]6;1;bg;*;default\a" }

#  function iterm2_tab_precmd() {
#    tab-reset
#  }

#  function iterm2_tab_preexec() {
#    if [[ "$1" =~ "^(guard$|yarn test)" ]]; then
#      tab-color 255 177 0
#    elif [[ "$1" =~ "^(rc|rails console|hc|hanami console)$" ]]; then
#      tab-color 90 255 55
#    elif [[ "$1" =~ "^(ys|yarn start)$" ]]; then
#      tab-color 0 255 192
#    elif [[ "$1" =~ "^(sidekiq|forman|docker-compose|hs$)" ]]; then
#      # tab-color 128 51 170
#      tab-color 150 100 255
#    elif [[ "$1" =~ "^(webpack|ww)$" ]]; then
#      tab-color 121 174 238
#    elif [[ "$1" =~ "^(rails|yarn)" ]]; then
#      tab-color 255 128 128
#    elif [[ "$1" =~ "^(deploy|cap (production|staging )?deploy)" ]]; then
#      tab-color 255 0 0
#    fi
#  }

#  autoload -U add-zsh-hook
#  add-zsh-hook precmd  iterm2_tab_precmd
#  add-zsh-hook preexec iterm2_tab_preexec
#fi

#-------------------------------------------------------------------------------
# background colors
#-------------------------------------------------------------------------------
#if [[ -n "$ITERM_SESSION_ID" ]]; then
#  function tabc() {
#    NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi # if you have trouble with this, change
#                                                        # "Default" to the name of your default theme
#    echo -e "\033]50;SetProfile=$NAME\a"
#  }
#  function colorssh() {
#    # trap "tab-reset" INT EXIT
#    tabc SSH
#    tab-color 255 0 0
#    ssh $*
#    tab-reset
#    tabc
#  }
#  alias ssh="colorssh"
#fi

#-------------------------------------------------------------------------------
# Rbenv
#-------------------------------------------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
