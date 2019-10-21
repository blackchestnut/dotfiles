# https://github.com/Homebrew/homebrew-bundle
# $> brew bundle

cask_args appdir: '/Applications'

# tap 'caskroom/fonts'
# tap 'homebrew/cask-cask'
tap 'homebrew/cask-versions'
tap 'homebrew/bundle'
tap 'homebrew/services'

brew 'git'
brew 'mc'
brew 'htop'
brew 'jq'
brew 'wget'

#---------------------------------------------------
# Ruby on Rails
#---------------------------------------------------
brew 'rbenv'
brew 'rbenv-ctags'
brew 'rbenv-gemset'
brew 'watchman'
brew 'node'
brew 'yarn'
brew 'imagemagick'
cask 'adoptopenjdk8' # required for elasticsearch
brew 'elasticsearch', restart_service: :changed
brew 'memcached', restart_service: :changed
brew 'redis', restart_service: :changed

#---------------------------------------------------
# Projects
#---------------------------------------------------
# Minisklad
brew 'FreeTDS'
brew 'ansible'

#---------------------------------------------------
# MacVim
#---------------------------------------------------
# brew 'macvim' brew install macvim --HEAD
brew 'ripgrep'
brew 'ctags'
brew 'the_silver_searcher'

#---------------------------------------------------
# AppStore
#---------------------------------------------------
mas 'Monosnap', id: 540348655
mas 'Elmedia Video Player', id: 1044549675

# Manual

# brew 'zsh'
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# brew install postgresql@9.6
# After install:
# brew services start postgresql@9.6
