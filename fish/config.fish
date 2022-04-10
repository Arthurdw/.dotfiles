if status is-interactive
	# Gets executed on shell startup
	function fish_greeting
	    fastfetch
	end

	# Make a directory and go to it
	function mkcd
	    mkdir -p $argv && cd $argv
	end

    # Generate a random string x chars long
    alias rstr='openssl rand -hex'

	# Vim aliases
    alias v='nvim'
	alias vi='v'
	alias vim='v'
	alias vimtutor='v +Tutor'

	# General aliases
	alias cls='clear'
	alias py='python3'

	# Git related aliases
	alias gmc='gitmoji -c'
	alias ghs='git status'
	alias ghp='git push'
	alias ghc='git commit -m'
	alias gha='git add .'
	alias gmca='gha && gmc'
	alias ghg='git log --all --decorate --oneline --graph'
	alias ghr='git reflog'
	alias ghca='git commit --amend'
	alias ghst='git stash'
	alias ghsts='ghst show -p'
	alias ghstss='ghst save'
	alias ghstp='ghst pop'
	alias ghstd='ghst drop'
	alias ghc='git checkout'
	alias ghcr='ghc --'
	alias ght='git tag'
	alias ghta='ght -a'
	alias ghtd='ght -d'
    alias ghbc='git fetch -p && git branch -vv | awk "/: gone]/{print $1}" | xargs git branch -d'

	# Aliases for non default applications
	alias cat='batcat -p'
    alias l='ls -alFhS'
	alias ll='natls --long'
	alias fire='DISPLAY= cacafire'

	# Config aliases
	set FISH_PATH ~/.config/fish/config.fish
	alias efish='vim $FISH_PATH && source $FISH_PATH'

	# Set default editor to neovim
	set -x EDITOR nvim
end
