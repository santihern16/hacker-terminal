# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Disable Oh My Zsh security check for shared configurations
export ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    sudo
    web-search
    history
    colored-man-pages
    colorize
    command-not-found
    docker
    docker-compose
    python
    pip
    npm
    node
    nmap
    systemd
    z
    extract
    copypath
    copyfile
    dirhistory
    jsontools
    urltools
    encode64
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

source $ZSH/oh-my-zsh.sh

# ═══════════════════════════════════════════════════════════════════════
# ⚡ HACKER CONFIGURATION ⚡
# ═══════════════════════════════════════════════════════════════════════

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History configuration
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt share_history
setopt append_history
setopt inc_append_history

# Auto-suggestions configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#666666'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Syntax highlighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('sudo *' 'fg=white,bold,bg=red')

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# ═══════════════════════════════════════════════════════════════════════
# ⚡ HACKER ALIASES ⚡
# ═══════════════════════════════════════════════════════════════════════

# System aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Git aliases (epic hacker style)
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gr='git reset'
alias gf='git fetch'

# Kali Linux hacker aliases
alias nmap-quick='nmap -T4 -F'
alias nmap-intense='nmap -T4 -A -v'
alias ports='netstat -tulanp'
alias listening='lsof -i'
alias myip='curl -s http://whatismyip.akamai.com/ && echo'
alias localip='ip route get 1 | awk "{print \$NF;exit}"'
alias ips='ip addr show | grep "inet " | awk "{print \$2}" | cut -d/ -f1'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# System info aliases
alias sysinfo='inxi -Fxz'
alias diskusage='df -h | grep -vE "^Filesystem|tmpfs|cdrom"'
alias diskspace='du -h --max-depth=1 | sort -hr'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias cpuinfo='lscpu'
alias temp='sensors'

# Network and security
alias netcons='lsof -i'
alias flushdns='sudo systemctl restart systemd-resolved'
alias iptlist='sudo iptables -L -n -v --line-numbers'
alias firewall='sudo ufw status verbose'

# File operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Quick edit configs
alias zshconfig='nano ~/.zshrc'
alias ohmyzsh='nano ~/.oh-my-zsh'
alias reload='source ~/.zshrc'

# Fun hacker stuff
alias matrix='cmatrix -s -C red'
alias hacker='cat /dev/urandom | hexdump -C | grep "ca fe"'
alias genpass='openssl rand -base64 32'
alias fortune='fortune | cowsay'
alias train='sl'
alias cat='batcat'
alias bat='batcat'
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -alF --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias l='eza -F --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'
alias l.='eza -a | grep -E "^\\."'
alias find='fd'
alias top='btop'
alias grep='rg'

# Docker aliases (for the modern hacker)
alias dps='docker ps'
alias dimg='docker images'
alias dexec='docker exec -it'
alias dlog='docker logs'
alias dstop='docker stop'
alias dstart='docker start'
alias drm='docker rm'
alias drmi='docker rmi'
alias dprune='docker system prune -a'

# Kitty terminal aliases (epic terminal management)
alias kitty-config='nano ~/.config/kitty/kitty.conf'
alias kitty-theme='~/.config/kitty/switch-theme.sh'
alias kitty-reload='pkill -USR1 kitty'
alias kitty-matrix='~/.config/kitty/switch-theme.sh matrix'
alias kitty-dracula='~/.config/kitty/switch-theme.sh dracula'
alias kitty-tokyo='~/.config/kitty/switch-theme.sh tokyo'

# ═══════════════════════════════════════════════════════════════════════
# ⚡ CUSTOM FUNCTIONS ⚡
# ═══════════════════════════════════════════════════════════════════════

# Extract any archive
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick port scanner
qscan() {
    nmap -sS -O $1
}

# Weather check
weather() {
    curl -s "http://wttr.in/$1"
}

# Create and enter directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Find files quickly
ff() {
    find . -type f -name "*$1*"
}

# Process grep
psg() {
    ps aux | grep -v grep | grep "$@" -i --color=auto
}

# ═══════════════════════════════════════════════════════════════════════
# ⚡ ENVIRONMENT VARIABLES ⚡
# ═══════════════════════════════════════════════════════════════════════

# Editor
export EDITOR='nano'
export VISUAL='nano'

# Colors for ls and grep
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'

# Path additions
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# ═══════════════════════════════════════════════════════════════════════
# ⚡ WELCOME MESSAGE ⚡
# ═══════════════════════════════════════════════════════════════════════

# Welcome message (only show once per terminal session and only for original user)
# Check if this is an interactive shell, not a root shell, and welcome hasn't been shown
if [[ $- == *i* ]] && [[ "$USER" != "root" ]] && [[ -z "$HACKER_WELCOME_SHOWN" ]]; then
    # Mark that welcome message has been shown in this session tree
    export HACKER_WELCOME_SHOWN=1
    
    echo
    figlet -f small "HACKER MODE" 2>/dev/null || echo "⚡ HACKER MODE ACTIVATED ⚡"
    echo "\033[1;32m═══════════════════════════════════════════════════════════════════════\033[0m"
    echo "\033[1;31m🚀 Welcome back, $(whoami)! Ready to escape the matrix? 🚀\033[0m"
    echo "\033[1;33m💻 System: $(uname -sr)\033[0m"
    echo "\033[1;34m⏰ Uptime: $(uptime -p)\033[0m"
    echo "\033[1;35m🌐 Terminal: $TERM\033[0m"
    echo "\033[1;36m📁 PWD: $(pwd)\033[0m"
    echo "\033[1;32m═══════════════════════════════════════════════════════════════════════\033[0m"
    echo "\033[1;37m💡 Pro tip: Try 'fortune', 'matrix', or './test-nerd-fonts.sh'\033[0m"
    echo
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
