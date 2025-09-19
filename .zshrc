(cat ~/.cache/wal/sequences &)

eval "$(starship init zsh)"

# fetch system information
$HOME/.config/fastfetch/fastfetch.sh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh                   # Autosuggestions for commands
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh           # Syntax Highlighting and colors
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh # Substring history search using up and down arrow keys
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

#Zsh Auto-Suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#696969,bold"
HISTSIZE=1000             # Maximum events for internal history
SAVEHIST=1000             # Maximum events in history file
HISTDIR=~/.cache/zsh      # History directory
HISTFILE=$HISTDIR/history # History filepath
mkdir -p "$HISTDIR"       # Create history directory if it doesn't exist
touch "$HISTDIR/history"  # Create history file if it doesn't exist

# Zsh Tab Complete
autoload -U compinit
compinit

#Zsh Substring History Search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases for ls
alias ls='lsd'

# Aliases for cat
alias cat='bat'

# Aliases for wallpaper switch toggle
alias toggletheme="source $HOME/scripts/switch-wallpaper.sh"

# Aliases for fastfetch
fastfetch() {
    clear
    $HOME/.config/fastfetch/fastfetch.sh
    if zle; then
        echo
        zle redisplay
    fi
}
alias f=fastfetch

TRAPUSR1() {
    fastfetch
}

# Aliase functions
function code() {
    /bin/code $1 && exit
}
function v() {
    /bin/neovide --fork $1 && exit
}

# Test Connection
TEST_CONNECTION="$HOME/.config/hypr/scripts/test-connection.sh"
alias conn=$TEST_CONNECTION

# Aliases for neofetch
alias n=$NEOFETCH

# Aliases for logout
alias logout='hyprctl dispatch exit'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Waifu Chat Bot and Assistant
alias waifu='source $HOME/linux-chat-bot/waifu.sh'

# Custom Zsh config
[[ -f "$HOME/custom.zshrc" ]] && source "$HOME/custom.zshrc"
