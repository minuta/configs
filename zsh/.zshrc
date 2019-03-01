# Path to your oh-my-zsh installation.
export ZSH=/home/qp/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="nicoulaj"
#ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 #COMPLETION_WAITING_DOTS="true"

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
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
#plugins=(git python command-not-found fancy-ctrl-z fzf zsh-autosuggestions)
plugins=( git python command-not-found fancy-ctrl-z fzf z extract)

# User configuration

export PATH="/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ag="~/AG/ag"
#
# alias tmux='tmux -2'
# alias tmux="TERM=screen-256color-bce tmux"

# export PAGER="most"
# Use colors for less, man, etc.
# [[ -f ~/.MYLESS ]] && . ~/.MYLESS

# 0: gray
# 1: red
# 2: green
# 4: cyan
# 5: magenta
# 6: light cyan
# 7: 
# export LESS_TERMCAP_mb=$(tput bold; tput setaf 1) # enter blinking mode - red
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # Green as main Color
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode    
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(tput bold; tput setaf 1) # red parameters


# bindkey -v

# export EDITOR=/usr/bin/nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

path+='/home/qp/.fzf'
#path+='/home/qp/Projects/bluepill_application_loader/build'
path+='/home/qp/Projects/ns-3.29/build/lib'

#autoload predict-on
#predict-on

# fancy-ctrl-z () {
  #if [[ $#BUFFER -eq 0 ]]; then
    #BUFFER="fg"
    #zle accept-line
  #else
    #zle push-input
    #zle clear-screen
  #fi
#}
#zle -N fancy-ctrl-z
#bindkey '^Z' fancy-ctrl-z

#alias l='ls --group-directories-first -X'
alias l='ls -X'
alias xclip='xclip -se c'
alias rm='rm -i'
alias cdc='cd -'

alias nvim='~/Software/nvim.appimage'
alias v='nvim'
#alias vim='vim'
alias cdg='cd ~/Projects/ns-3.29/src/grail/ && pwd'
alias cdn='cd ~/Projects/ns-3.29/ && pwd'

alias emacs='emacs -nw'

#alias rr='LD_LIBRARY_PATH=~/Projects/ns-3.29/build'

setopt hist_ignore_all_dups

#export LD_LIBRARY_PATH=/home/qp/Projects/bluepill_application_loader/build

alias waf='~/Projects/ns-3.29/waf'

alias topten="history | commands | sort -rn | head"
#alias vimdiff='nvim -d'
