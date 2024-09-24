plugins=(tmux z git zsh-autosuggestions zsh-syntax-highlighting)
export ZSH="$HOME/.oh-my-zsh"
# MACOSX
# export XDG_CONFIG_HOME=$HOME/.config

ZSH_THEME="headline"
ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias ls="eza --icons"
alias ll="eza -l --icons"
alias lla="eza -l -a --icons"
alias llat="eza -l -a --tree --icons"
alias g=git
alias gaa="git add -A"
alias gst="git status"
alias gcz="git cz -a"
alias gcf="git commit --amend"
alias gl="git log"

findandkill() {
  $(lsof -ti:3000 | xargs kill)
}

alias kill_port=findandkill



source /home/p1n9d3v/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/p1n9d3v/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="/home/p1n9d3v/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
