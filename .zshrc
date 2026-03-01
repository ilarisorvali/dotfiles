# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ilari/.zshrc'

autoload -Uz compinit
compinit
zstyle ':completion:' menu select

#git prompt
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:*' enable git
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

setopt PROMPT_SUBST

PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f%F{magenta}${vcs_info_msg_0_}%f %# '

# Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Syntax highlighting (must be last)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


# Common aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias vim='nvim'
alias sc='systemctl'
alias scs='systemctl status'
alias sce='systemctl enable'
alias scd='systemctl disable'
alias scr='systemctl restart'
alias scst='systemctl start'
alias scsp='systemctl stop'
alias scl='systemctl list-units'
alias sclf='systemctl list-unit-files'
alias jc='journalctl'
alias jcu='journalctl -u'
alias jcf='journalctl -f'
alias jcb='journalctl -b'
alias jce='journalctl -xe'

#common dotfiles editing
alias vimniri='vim ~/.config/niri/config.kdl'

#Dotfiles management alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Default editor
export EDITOR=neovim
export PATH=$PATH:/home/ilari/.local/bin

# Dotfiles status check
dotfiles_status="$(config status)"
if ! echo "$dotfiles_status" | grep -q "nothing to commit"; then
  echo 'There are dotfiles changes to commit. Run "config status" to see them.'
fi

if echo "$dotfiles_status" | grep -q "Your branch is ahead"; then
  echo 'There are dotfiles commits to push. Run "config log" to see recent commits.'
fi

# Rust environment
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
