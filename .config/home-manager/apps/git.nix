{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    lazygit
  ];

  programs.lazygit.enable = true;


  programs.git = {
    enable = true;
    userEmail = "dev@arthurdw.com";
    userName = "Arthurdw";

    signing = {
      key = "30393DC036C318EF";
      signByDefault = true;
    };
  };
}
