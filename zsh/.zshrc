# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export LESS="-R -F -X $LESS"

ZSH_THEME="nanotech"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

export EDITOR=nvim

if [ -f "$HOME/.my_aliases" ]; then
  source "$HOME/.my_aliases"
fi

if [ -f "$HOME/.zsh_aliases" ]; then
    source $HOME/.zsh_aliases
fi

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target,__pycache__,.venv
  --preview 'tree -C {}'"
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target,__pycache__,.venv
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# UV autocompletion hack from here https://github.com/astral-sh/uv/issues/8432#issuecomment-2453494736
# License: CC0
eval "$(uv generate-shell-completion zsh)"

_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv

up() {
  if [ -z "$1" ]; then
    cd ../
    return 0
  fi

  directory_sequence=$(seq 1 "$1" | xargs -I {} echo "../" | paste -sd "")

  cd "$directory_sequence"
  return 0
}

# ZVM (Zig Version Manager) 
# install with curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash
export ZVM_INSTALL=/home/hayden/.local/share/zvm/self
export PATH=$PATH:/home/hayden/.local/share/zvm/bin
export PATH=$PATH:$ZVM_INSTALL

