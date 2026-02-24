# Exit if not running interactively
[[ $- != *i* ]] && return

# History
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Prompt (simple)
PS1='\u@\h:\w\$ '

# Enable bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Readline / tab completion behavior
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Useful shell options
shopt -s checkwinsize
shopt -s globstar

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


