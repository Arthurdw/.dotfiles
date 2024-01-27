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
  bun
  dotenv
  fd
  flutter
  git-commit
  git-flow
  gh
  history
  minikube
  node
  nvm
  npm
  react-native
  rust
  sudo
  systemd
  terraform
  thefuck
  tmux
  shellfirm
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
export PATH="$PATH:/home/arthur/.cargo/bin/"

update_all() {
    export TMPFILE="$(mktemp)";
    sudo true;
    rate-mirrors --save=$TMPFILE arch --max-delay=43200 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist 
}

alias l="exa -laa"
alias lg="lazygit"
alias upd="update_all"
alias zshr="source /home/arthur/.zshrc"

source /usr/share/nvm/init-nvm.sh
