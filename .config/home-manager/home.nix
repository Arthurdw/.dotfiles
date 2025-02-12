# TODO: install teamviewer

{ pkgs, ... }: 
let
  #Returns a list of "dir/filename" for all files in a dir
  filesIn = dir: (map (fname: dir + "/${fname}")
                      (builtins.attrNames (builtins.readDir dir)));
in
{
  home = {
    username = "arthur";
    homeDirectory = "/home/arthur";
    stateVersion = "24.11";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate  = (_: true);
  };

  imports = []
    ++ (filesIn ./apps);

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
    terraform
    spotify
    qalculate-qt
    python313

    # Rust
    rustup
    sccache
    cargo-nextest
    cargo-watch
    cargo-tauri

    # General development
    marksman
    postman
  ];


  programs.home-manager.enable = true;

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
