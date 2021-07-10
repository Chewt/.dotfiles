# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hayden/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/Gits/powerlevel10k/powerlevel10k.zsh-theme

#import wal colors
. "${HOME}/.cache/wal/colors.sh"

(cat ~/.cache/wal/sequences &)

# aliases
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias lichess='brave --app=https://lichess.org'
alias dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'
alias less='less -R'

function themeset ()
{
    wal -q -n -i $1
    feh --bg-scale $1
    spicetify -q update
    i3-msg -q restart
    #swaymsg -q restart
    #swaymsg output "*" background $(pwd)/$1 fill
    zathura-pywal -a .88 > /dev/null
    wal --preview
}

function yank ()
{
    xclip -r -selection "clipboard" $1
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
