# TODO: install teamviewer

{ pkgs, ... }:
let
  #Returns a list of "dir/filename" for all files in a dir
  filesIn = dir:
    (map (fname: dir + "/${fname}")
      (builtins.attrNames (builtins.readDir dir)));
in {
  home = {
    username = "arthur";
    homeDirectory = "/home/arthur";
    stateVersion = "24.11";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  imports = [ ] ++ (filesIn ./apps) ++ (filesIn ./services);

  home.packages = with pkgs; [
    unzip
    brave
    nautilus
    discord
    stremio
    grim
    gnumake
    fzf
    ripgrep
    fd
    signal-desktop
    vlc
    loupe
    twingate
    dig
    blueman
    terraform
    spotify
    qalculate-qt
    libqalculate
    pgcli
    zoom-us
    wallust
    mission-center
    gnome-disk-utility
    btop
    gimp
    openscad
    zathura
    htop
    tree-sitter
    packer
    prettierd
    sqlfluff
    go
    openjdk17-bootstrap

    python313
    python313Packages.pip
    python313Packages.keyring

    php84
    php84Packages.composer

    bottles

    # General development
    marksman
    insomnia
    jq
  ];

  programs.home-manager.enable = true;

  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "daily";
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
}
