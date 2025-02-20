{ pkgs, ... }: {
  home.packages = with pkgs; [
    oh-my-zsh
    zsh-you-should-use
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      hsw = "home-manager switch";
      hupgrade = "nix-channel --update && home-manager switch";
      rebuild = "sudo nixos-rebuild switch";
      upgrade = "sudo nix-channel --update && sudo nixos-rebuild switch --upgrade";
      v = "nvim";
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
        "terraform"
        "doctl"
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
}
