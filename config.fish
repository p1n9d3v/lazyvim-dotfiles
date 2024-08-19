# set default node version

nvm use v18

# set color
set fish_color_command 77E4C8 --bold

# eza alias
alias ls "eza --icons"
alias ll "eza -l --icons"
alias lla "eza -l -a --icons"
alias llat "eza -l -a --tree --icons"
alias vim nvim
alias g git
alias gaa "git add -A"
alias gcz "git cz -a"
alias gl "git log"


# fzf key bindings

fzf_configure_bindings --directory=\cf --variables=\e\cv
