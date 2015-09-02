# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="admiralswan"

export DEFAULT_USER="caleb"
export KEYTIMEOUT=1

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras cp vi-mode catimg z zsh-history-substring-search zsh-syntax-highlighting archlinux python)

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

setopt extendedglob

source $ZSH/oh-my-zsh.sh

# User configuration
eval `dircolors ~/.dircolors`

export PATH=$HOME/bin:$PATH
export PATH=$HOME/Sources/Small/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias du="du -h --max-depth=1 | sort -h"
alias rsync="rsync -avz"

packillorphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rns $(pacman -Qdtq)
  fi
}

alias l='ls'
alias ll='ls -lh'
alias lll='ls -alh'
alias sl='ls' # often screw this up

alias t="vim ~/Dropbox/todo.txt"
alias c="clear"

alias top="htop"
alias v="nvim"
alias vim="nvim"
alias quartus="quartus --64bit"

alias lsF="ls | pyp \"sorted(pp, key = lambda x: x.split('.')[-1])\""
alias qtpython="ipython qtconsole"
alias vimdiff="nvim -d"
alias view="nvim -R"
alias touchoff="xinput disable ELAN\ Touchscreen"
alias touchon="xinput enable ELAN\ Touchscreen"

alias sshHTPC="ssh caleb@192.168.254.1"
alias sshsilpix="ssh -Y silpix5@silpix5.unl.edu"
alias sshcosmic="ssh -Y husker@phys-cosmicstation.unl.edu"


# Find files that don't contain Ampl
#find . -type f | xargs grep -H -c 'Ampl' | grep 0$ | cut -d':' -f1

#list post-aliases here
alias -s pdf=evince
alias -s ps=evince
alias -s png=eog
alias -s jpg=eog
alias -s jpeg=eog
alias -s doc=libreoffice
alias -s docx=libreoffice
alias -s xls=libreoffice


bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

cowfortune() {
  f=/tmp/cowsaytemp
  fortune | cowsay -f stegosaurus -W 80 > $f
  let "N = `cat $f | wc -l`-14"
  head -$N $f
  tail -14 $f | toilet -f term --termwidth --gay
  }

# Fix italics in vim
export TERM=xterm-256color-italic
cowfortune
