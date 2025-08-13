#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════
# 🚀 HACKER TERMINAL INSTALLER - KALI LINUX EDITION 🚀
# ═══════════════════════════════════════════════════════════════════════
# 
# Autor: Creado para s4ntixo
# Versión: 1.0
# Descripción: Instalación automática completa de Oh My Zsh + Plugins + Nerd Fonts
# Compatible: Kali Linux / Debian / Ubuntu
#
# ═══════════════════════════════════════════════════════════════════════

set -e  # Exit on any error

# Colors para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Función para imprimir con colores
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[⚠]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_header() {
    echo -e "${PURPLE}
 ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀▓█████  ██▀███  
▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒
▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒███   ▓██ ░▄█ ▒
░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄  
░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░▒████▒░██▓ ▒██▒
 ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░░ ▒░ ░░ ▒▓ ░▒▓░
 ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ░ ░  ░  ░▒ ░ ▒░
 ░  ░░ ░  ░   ▒   ░        ░ ░░ ░    ░     ░░   ░ 
 ░  ░  ░      ░  ░░ ░      ░  ░      ░  ░   ░     
                  ░                               
${NC}"
    echo -e "${CYAN}╔════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║              🚀 HACKER TERMINAL INSTALLER 🚀                      ║${NC}"
    echo -e "${CYAN}║                    Kali Linux Edition                             ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════════════════╝${NC}"
    echo
}

# Función para verificar si el comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Función para hacer backup de configuraciones existentes
backup_configs() {
    print_info "Haciendo backup de configuraciones existentes..."
    
    if [ -f ~/.zshrc ]; then
        cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
        print_status "Backup de .zshrc creado"
    fi
    
    if [ -d ~/.oh-my-zsh ]; then
        mv ~/.oh-my-zsh ~/.oh-my-zsh.backup.$(date +%Y%m%d_%H%M%S)
        print_status "Backup de .oh-my-zsh creado"
    fi
}

# Función para instalar paquetes del sistema
install_system_packages() {
    print_info "Instalando paquetes del sistema..."
    
    # Actualizar repos
    sudo apt update
    
    # Instalar herramientas esenciales
    sudo apt install -y \
        zsh \
        git \
        curl \
        wget \
        figlet \
        lolcat \
        cmatrix \
        htop \
        btop \
        bat \
        eza \
        fd-find \
        ripgrep \
        fzf \
        cowsay \
        fortune-mod \
        sl \
        neofetch 2>/dev/null || true
        
    print_status "Paquetes del sistema instalados"
}

# Función para instalar Oh My Zsh
install_oh_my_zsh() {
    print_info "Instalando Oh My Zsh..."
    
    if [ ! -d ~/.oh-my-zsh ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        print_status "Oh My Zsh instalado"
    else
        print_warning "Oh My Zsh ya está instalado"
    fi
}

# Función para instalar Powerlevel10k
install_powerlevel10k() {
    print_info "Instalando tema Powerlevel10k..."
    
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        print_status "Powerlevel10k instalado"
    else
        print_warning "Powerlevel10k ya está instalado"
    fi
}

# Función para instalar plugins externos
install_external_plugins() {
    print_info "Instalando plugins externos..."
    
    local custom_dir="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"
    
    # zsh-autosuggestions
    if [ ! -d "$custom_dir/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions $custom_dir/plugins/zsh-autosuggestions
        print_status "zsh-autosuggestions instalado"
    fi
    
    # zsh-syntax-highlighting
    if [ ! -d "$custom_dir/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $custom_dir/plugins/zsh-syntax-highlighting
        print_status "zsh-syntax-highlighting instalado"
    fi
    
    # zsh-completions
    if [ ! -d "$custom_dir/plugins/zsh-completions" ]; then
        git clone https://github.com/zsh-users/zsh-completions $custom_dir/plugins/zsh-completions
        print_status "zsh-completions instalado"
    fi
}

# Función para instalar Nerd Fonts
install_nerd_fonts() {
    print_info "Instalando Nerd Fonts..."
    
    # Crear directorio de fuentes
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    
    # Descargar MesloLGS NF
    fonts_to_download=(
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
        "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf"
        "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf"
    )
    
    local font_names=(
        "MesloLGS NF Regular.ttf"
        "MesloLGS NF Bold.ttf"
        "MesloLGS NF Italic.ttf"
        "MesloLGS NF Bold Italic.ttf"
        "Hack Regular Nerd Font Complete.ttf"
        "FiraCode Nerd Font Complete.ttf"
    )
    
    for i in ${!fonts_to_download[@]}; do
        if [ ! -f "${font_names[$i]}" ]; then
            curl -fLo "${font_names[$i]}" "${fonts_to_download[$i]}"
            print_status "Font ${font_names[$i]} descargada"
        fi
    done
    
    # Actualizar cache de fuentes
    fc-cache -fv ~/.local/share/fonts
    print_status "Nerd Fonts instaladas y cache actualizado"
    
    cd ~
}

# Función para crear la configuración .zshrc
create_zshrc_config() {
    print_info "Creando configuración .zshrc..."
    
    cat > ~/.zshrc << 'EOF'
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# ═══════════════════════════════════════════════════════════════════════
# ⚡ HACKER ALIASES ⚡
# ═══════════════════════════════════════════════════════════════════════

# System aliases
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

# Modern command replacements
alias cat='bat'
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

# Path additions
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# ═══════════════════════════════════════════════════════════════════════
# ⚡ WELCOME MESSAGE ⚡
# ═══════════════════════════════════════════════════════════════════════

# Welcome message (run 'fortune' for a fun message!)
if [[ $- == *i* ]]; then
    echo
    figlet -f small "HACKER MODE" 2>/dev/null || echo "⚡ HACKER MODE ACTIVATED ⚡"
    echo "\\033[1;32m═══════════════════════════════════════════════════════════════════════\\033[0m"
    echo "\\033[1;31m🚀 Welcome back, $(whoami)! Ready to hack the matrix? 🚀\\033[0m"
    echo "\\033[1;33m💻 System: $(uname -sr)\\033[0m"
    echo "\\033[1;34m⏰ Uptime: $(uptime -p)\\033[0m"
    echo "\\033[1;35m🌐 Terminal: $TERM\\033[0m"
    echo "\\033[1;36m📁 PWD: $(pwd)\\033[0m"
    echo "\\033[1;32m═══════════════════════════════════════════════════════════════════════\\033[0m"
    echo "\\033[1;37m💡 Pro tip: Try 'fortune', 'matrix', or 'p10k configure'\\033[0m"
    echo
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF

    print_status "Configuración .zshrc creada"
}

# Función para crear scripts de utilidad
create_utility_scripts() {
    print_info "Creando scripts de utilidad..."
    
    # Script de test de Nerd Fonts
    cat > ~/test-nerd-fonts.sh << 'EOF'
#!/bin/bash

echo "==============================================="
echo "🚀 PRUEBA DE NERD FONTS - HACKER EDITION 🚀"
echo "==============================================="
echo ""

echo "📁 Iconos de archivos:"
echo "  📄 Documento"
echo "  🐍 Python"  
echo "  ⚡ JavaScript"
echo "  🐧 Linux"
echo "  🔒 Seguridad"
echo "  🌐 Web"
echo ""

echo "🔧 Iconos de desarrollo:"
echo "   Git Branch"
echo "   Docker"
echo "   Terminal"
echo "   Database"
echo "   Server"
echo ""

echo "⚡ Símbolos especiales:"
echo "  ▶ Play"
echo "  ⏸ Pause"  
echo "  ⏹ Stop"
echo "  🔄 Refresh"
echo "  ✅ Success"
echo "  ❌ Error"
echo "  ⚠️  Warning"
echo ""

echo "🎯 Test de prompt symbols:"
echo "❯ Prompt arrow"
echo "│ Separator"  
echo "├ Branch"
echo "└ End"
echo ""

echo "🌟 Si ves todos los iconos correctamente,"
echo "¡las Nerd Fonts están funcionando perfecto!"
echo "==============================================="
EOF

    chmod +x ~/test-nerd-fonts.sh
    print_status "Script test-nerd-fonts.sh creado"
}

# Función para cambiar shell por defecto
change_default_shell() {
    print_info "Cambiando shell por defecto a Zsh..."
    
    if [ "$SHELL" != "$(which zsh)" ]; then
        print_warning "Será necesario cambiar tu shell por defecto a Zsh"
        print_info "Ejecuta: chsh -s $(which zsh)"
        print_info "Luego reinicia tu sesión"
    else
        print_status "Zsh ya es tu shell por defecto"
    fi
}

# Función principal de instalación
main() {
    print_header
    
    print_info "Iniciando instalación del setup hacker..."
    echo
    
    # Verificar si es root
    if [[ $EUID -eq 0 ]]; then
        print_error "No ejecutes este script como root!"
        exit 1
    fi
    
    # Hacer backup de configuraciones
    backup_configs
    
    # Instalar paquetes del sistema
    install_system_packages
    
    # Instalar Oh My Zsh
    install_oh_my_zsh
    
    # Instalar Powerlevel10k
    install_powerlevel10k
    
    # Instalar plugins externos
    install_external_plugins
    
    # Instalar Nerd Fonts
    install_nerd_fonts
    
    # Crear configuración .zshrc
    create_zshrc_config
    
    # Crear scripts de utilidad
    create_utility_scripts
    
    # Cambiar shell por defecto
    change_default_shell
    
    echo
    print_status "¡Instalación completada exitosamente!"
    echo
    
    print_info "${GREEN}╔══════════════════════════════════════════════════════════════════╗${NC}"
    print_info "${GREEN}║                     🎉 ¡INSTALACIÓN COMPLETA! 🎉               ║${NC}"
    print_info "${GREEN}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo
    print_info "📋 Próximos pasos:"
    echo "   1. ${YELLOW}Configura tu terminal${NC} para usar la fuente 'MesloLGS NF Regular'"
    echo "   2. ${YELLOW}Ejecuta${NC}: chsh -s \$(which zsh) ${YELLOW}(si es necesario)${NC}"
    echo "   3. ${YELLOW}Reinicia tu terminal${NC} o ejecuta: source ~/.zshrc"
    echo "   4. ${YELLOW}Ejecuta${NC}: p10k configure ${YELLOW}(para personalizar el prompt)${NC}"
    echo "   5. ${YELLOW}Prueba${NC}: ./test-nerd-fonts.sh"
    echo
    print_info "🎮 Comandos geniales para probar:"
    echo "   • fortune    • matrix    • genpass    • ll    • myip"
    echo
    print_info "📖 Documentación completa en: ~/HACKER_SETUP_GUIDE.md"
    echo
    print_status "¡Disfruta tu nuevo superpoder hacker! 🚀💀⚡"
}

# Ejecutar instalación
main "$@"
