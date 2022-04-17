if status is-interactive
    # Gets executed on shell startup
    function fish_greeting
        # fastfetch
        fastfetch --structure Title:Separator:OS:Kernel:Uptime:Packages:Shell:CPU:GPU:Memory:Disk:Battery:LocalIP
    end

    function _ref
        if set -q argv[2]
            alias $argv[1]=$argv[2..-1]
            abbr -a -g $argv[1] $argv[2..-1]
        else
            echo "Error: _ref requires atleast two arguments. (call, mapped)" 1>&2
        end
    end

    # Make a directory and go to it
    function mkcd
        mkdir -p $argv && cd $argv
    end

    # Generate a random string x chars long
    _ref rstr 'openssl rand -hex'

    # Vim aliases
    _ref v nvim
    _ref vi v
    _ref vim v
    _ref vimtutor 'v +Tutor'

    # General aliases
    _ref cls clear
    _ref py python3

    # Git related aliases
    _ref gmc 'gitmoji -c'
    _ref ghs 'git status'
    _ref ghp 'git push'
    _ref ghc 'git commit -m'
    _ref gha 'git add .'
    _ref gmca 'gha && gmc'
    _ref ghg 'git log --all --decorate --oneline --graph'
    _ref ghr 'git reflog'
    _ref ghca 'git commit --amend'
    _ref ghst 'git stash'
    _ref ghsts 'ghst show -p'
    _ref ghstss 'ghst save'
    _ref ghstp 'ghst pop'
    _ref ghstd 'ghst drop'
    _ref ghc 'git checkout'
    _ref ghcr 'ghc --'
    _ref ght 'git tag'
    _ref ghta 'ght -a'
    _ref ghtd 'ght -d'
    _ref ghbc 'git fetch -p && git branch -vv | awk "/: gone]/{print $1}" | xargs git branch -d'

    # Key counter aliases (https://github.com/arthurdw/keycounter)
    alias __sortCSVBySecondValue="sort -n -k 2 -t ','"
    _ref kc '__sortCSVBySecondValue /etc/key-counter/data.csv'
    _ref kcc '__sortCSVBySecondValue /etc/key-counter/combinations.csv'

    # Aliases for non default applications
    _ref batcat bat
    _ref cat 'batcat -p'
    _ref l 'ls -alFhS'
    _ref ll 'natls --long'
    _ref fire 'DISPLAY= cacafire'

    # Config aliases
    set FISH_PATH ~/.config/fish/config.fish
    _ref efish 'vim $FISH_PATH && source $FISH_PATH'

    # Set default editor to neovim
    set -x EDITOR nvim
end
