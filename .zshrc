fastfetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  z
  docker
  ansible
  archlinux
  cp
#  bun
#  dotenv
  fd
#  flutter
  git-commit
  git-flow
  gh
  history
#  minikube
  node
  nvm
  npm
#  react-native
  rust
  sudo
  systemd
  terraform
  thefuck
  tmux
  zsh-syntax-highlighting
  zsh-autosuggestions
  you-should-use
)

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export ARCHFLAGS="-arch x86_64"
export RUSTC_WRAPPER=~/.cargo/bin/sccache
export PATH="$PATH:$HOME/.cargo/bin/"

update_all() {
    export TMPFILE="$(mktemp)"
    sudo true

    rate-mirrors --save=$TMPFILE arch --max-delay=43200 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && paru -Syu
}

alias l="exa -laa"
alias lg="lazygit"
alias upd="update_all"
alias zsr="source $HOME/.zshrc"
alias v="nvim"
alias ssh="kitty +kitten ssh"

source /usr/share/nvm/init-nvm.sh

# pnpm
export PNPM_HOME="/home/arthur/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###

export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export PATH="/usr/bin/flutter/bin:$PATH"
