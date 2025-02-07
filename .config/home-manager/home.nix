# TODO: multiple files
# TODO: install teamviewer


{ config, pkgs, ... }: {
  home = {
    username = "arthur";
    homeDirectory = "/home/arthur";
    stateVersion = "24.11";
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    unzip
    brave
    nautilus
    discord
    stremio
    grim
    gnumake
    nodejs
    pnpm
    fzf
    ripgrep
    fd
    signal-desktop
    racket
    vlc
    loupe
    twingate
    dig
    blueman
    oh-my-zsh

    # Rust
    rustup
    sccache
    cargo-nextest
    cargo-watch

    # zsh
    zsh-you-should-use
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate  = (_: true);
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };


  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      hsw = "home-manager switch";
      rebuild = "sudo nixos-rebuild switch";
      upgrade = "sudo nix-channel --update && sudo nixos-rebuild switch --upgrade";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      lg = "lazygit";
      rt = "cargo nextest run --all";
    };

    sessionVariables = {
      RUSTC_WRAPPER = pkgs.lib.getExe pkgs.sccache;
      PATH = "$PATH:$HOME/.cargo/bin";
    };

    oh-my-zsh = {
      enable = true;
      theme = "refined";
      plugins = [
        "git"
        "z"
        "ansible"
        "vagrant"
        "sudo"
        "rust"
        "kubectl"
        "helm"
      ];
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    plugins = [
      {
        name = pkgs.zsh-you-should-use.pname;
        src = pkgs.zsh-you-should-use.src;
      }
    ];
  };

  programs.git = {
    enable = true;
    userEmail = "dev@arthurdw.com";
    userName = "Arthurdw";
  };

  programs.lazygit.enable = true;
}
