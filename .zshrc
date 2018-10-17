#-----------------------------------------------------------------------------------------
# Path to your oh-my-zsh configuration.
#-----------------------------------------------------------------------------------------

ZSH_THEME="robbyrussell"
HISTSIZE=100000
HISTFILESIZE=200000
TERM="xterm-256color"
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby bundler capistrano gem osx zeus rvm ssh-agent rake brew command-not-found compleat composer cp history history-substring-search git-remote-branch git git-flow git-extras github pow)

#-----------------------------------------------------------------------------------------
# Environment variables
#-----------------------------------------------------------------------------------------

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=$HOME/go        # Go Workspaces
export PATH=$PATH:$GOPATH/bin # Add Go bins to PATH for installed golang-programms
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.rbenv/bin:$PATH" # Add rbenv path.
export ANDROID_HOME=/usr/local/share/android-sdk     # React Native for Android
export ANDROID_SDK_ROOT=ANDROID_HOME                 #
export PATH=${PATH}:${ANDROID_HOME}/tools            # - android
export PATH=${PATH}:${ANDROID_HOME}/tools/bin        # - sdkmanager and avdmanager
export PATH=${PATH}:${ANDROID_HOME}/platform-tools   # - adb (Android Debug Bridge)
export BUNDLER_EDITOR=mvim # For $ bundle open gem_name
export REACT_EDITOR=mvim
export EDITOR=mvim
source ~/.environments

#-----------------------------------------------------------------------------------------
# Aliases, cd ~/my_projects
#-----------------------------------------------------------------------------------------

RALSPROJECTS="~/projects"
alias my="cd $RALSPROJECTS/mybudget"
alias vi="cd $RALSPROJECTS/vimocean"
alias ag="cd $RALSPROJECTS/agileseason"
alias a="cd $RALSPROJECTS/agileseason2"
alias ac="cd $RALSPROJECTS/agileseason2/client"
alias ad="cd $RALSPROJECTS/agileseason.github.io"
alias tt="cd $RALSPROJECTS/trantoria"
alias ch="cd $RALSPROJECTS/chef"
alias ic="cd $RALSPROJECTS/iceperk"
alias ica="cd $RALSPROJECTS/iceperkapp"
alias co="cd $RALSPROJECTS/complead"
alias tr="cd $RALSPROJECTS/trantoria"
alias grin="cd $RALSPROJECTS/grin"
alias as="cd $RALSPROJECTS/grin/amazing-supplies"
alias aw="cd $RALSPROJECTS/grin/grin"
alias ass="cd $RALSPROJECTS/grin/asscraper"
alias asa="cd $RALSPROJECTS/grin/asapp"
alias mygo="cd $GOPATH/src/github.com/blackchestnut"
cd_projects() {
  cd ~/projects/$1
}
alias pr=cd_projects

#-----------------------------------------------------------------------------------------
# bash / zsh
#-----------------------------------------------------------------------------------------

alias reload='. ~/.zshrc'
alias m='mvim'
alias mzsh='mvim ~/.zshrc'
alias mvimrc='mvim ~/.vim/vimrc'

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
alias pull=gu
alias push=gp

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
alias dp=pdeploy
alias ds=sdeploy
alias rake='noglob rake'

#-----------------------------------------------------------------------------------------
# Tools
#-----------------------------------------------------------------------------------------

alias faye='rackup faye.ru -s thin -E production'
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

alias emulator='cd /usr/local/share/android-sdk/emulator && ./emulator'
alias avd='emulator -avd Nexus_5X_API_23_x86_64 -gpu host -skin 1080x1920'

#-----------------------------------------------------------------------------------------
# Init
#-----------------------------------------------------------------------------------------

# Rbenv
# eval "$(rbenv init -)"

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
