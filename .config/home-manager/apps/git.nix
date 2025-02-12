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
  };
}
