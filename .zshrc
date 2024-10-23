# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(tmux z git  zsh-syntax-highlighting zsh-autosuggestions zsh-vi-mode)
export ZSH="$HOME/.oh-my-zsh"

# MACOSX
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=/opt/homebrew/bin:$PATH

# OH-MY-ZSH
export OH_MY_ZSH=$HOME/.oh-my-zsh


ZSH_THEME="powerlevel10k/powerlevel10k"

if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
    ZSH_TMUX_AUTOSTART=true
elif [ -n "$WEZTERM_EXECUTABLE" ]; then
    # WEZTERM
    export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"
fi

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
alias kill_port=findandkill
alias cdh="cd ~"


# if installation pnpm , then npm is setted alias to pnpm
if [ -x "$(command -v pnpm)" ]; then
  alias npm=pnpm
fi

findandkill() {
  local port=$1
  $(lsof -ti:$port | xargs kill)
}

killtmuxsessions() {
  $(tmux kill-session -a)
}

movedotfiles() {
    local dotfiles_path=~/Developments/dotfiles
    $(cp ~/.zshrc $dotfiles_path/.zshrc)

    if [ ! -d "$dotfiles_path/karabiner" ]; then
        $(mkdir -p $dotfiles_path/karabiner)
    fi
    $(cp ~/.config/karabiner/karabiner.json $dotfiles_path/karabiner/karabiner.json)

    if [ ! -d "$dotfiles_path/tmux" ]; then
        $(mkdir -p $dotfiles_path/tmux)
    fi
    $(cp ~/.config/tmux/tmux.conf $dotfiles_path/tmux/tmux.conf)

    $(cp -r ~/.config/nvim $dotfiles_path/)
    
    $(cp -r ~/.config/lazygit $dotfiles_path/)

    $(cp -r ~/.config/aerospace $dotfiles_path/)

    $(cp -r ~/.config/wezterm $dotfiles_path/)

    $(cp -r ~/.config/sketchybar $dotfiles_path/)
}


source $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# vi-zsh-mode
bindkey -M vicmd '^H' beginning-of-line  
bindkey -M vicmd '^L' end-of-line       

bindkey -M visual '^H' beginning-of-line
bindkey -M visual '^L' end-of-line

bindkey -M viins '^H' beginning-of-line
bindkey -M viins '^L' end-of-line
