# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH=/Users/dylanpierce/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

DEFAULT_USER=dylan

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=()
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bgnotify docker docker-compose zsh-wakatime zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"


alias docker_kill_dangling="docker volume rm `docker volume ls -q -f dangling=true`"

export PATH=~/.composer/vendor/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


export PATH="./node_modules/.bin:$PATH" 


#source "/Users/dylanpierce/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

eval "$(direnv hook zsh)"
export PATH="/usr/local/sbin:$PATH"
source <(awless completion zsh)

alias new_mac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"

### DOCKER ALIASES ####
alias dco='docker-compose'

alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcps='docker-compose ps'
alias dcrestart='docker-compose restart'
alias dcrm='docker-compose rm'
alias dcr='docker-compose run --rm'
alias dcstop='docker-compose stop'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'
alias dcdn='docker-compose down'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dcpull='docker-compose pull'
alias dcstart='docker-compose start'

#VIM STUFF
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1


# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/dylanpierce/.netlify/helper/path.zsh.inc' ]; then source '/Users/dylanpierce/.netlify/helper/path.zsh.inc'; fi

# for installing Broot properly
source /Users/dylanpierce/Library/Preferences/org.dystroy.broot/launcher/bash/br

dcsc() {
	docker-compose -f /Users/dylanpierce/projects/rvshare-setup/docker-compose.scrubcop.yml $@
}

dcscb() {
	docker-compose -f /Users/dylanpierce/projects/rvshare-setup/docker-compose.scrubcop.yml build $@
}

onfido_check() {
	curl "https://api.onfido.com/v2/applicants/$1/checks/$2?expand=reports" -H 'Authorization: Token token=${ONFIDO_API_KEY}'
}

dl_onfido_photo() {
        curl "https://api.onfido.com/v2/live_photos/$1/download" -H 'Authorization: Token token=${ONFIDO_API_KEY}' --output $2
}

onfido_start_check() {
	curl https://api.onfido.com/v2/applicants/$1/checks \
	  -H 'Authorization: Token token=${ONFIDO_API_KEY}' \
	  -H 'Content-Type: application/json' \
	  -d '{"type": "express","reports": [{"name": "document"},{"name": "facial_similarity","variant": "standard"}]}'
}


# short for rubocop rvshare-api
alias rcapi='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs docker-compose run rvshare-api rubocop'
# short for rubocop rvshare-marketplace
alias rcmp='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs docker-compose run rvshare-marketplace rubocop'

# short for clean up all docker things
alias docker-clean='docker container prune && docker volume prune && docker image prune'

# for fixing that pesky mysql2 gem install error
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
