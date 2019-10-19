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
brew 'imagemagick'
# brew 'macvim' brew install macvim --HEAD
brew 'ripgrep'
brew 'wget'
brew 'yarn'
cask 'adoptopenjdk8' # required for elasticsearch
brew 'elasticsearch', restart_service: :changed
brew 'memcached', restart_service: :changed
brew 'redis', restart_service: :changed

brew 'rbenv'
brew 'rbenv-ctags'
brew 'rbenv-gemset'
brew 'watchman'
brew 'node'

# for minisklad
brew 'FreeTDS'
brew 'ansible'

mas 'Monosnap', id: 540348655

# Manual

# brew 'zsh'
# brew 'zsh-completions'
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
