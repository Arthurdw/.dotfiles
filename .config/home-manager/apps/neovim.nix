# TODO: configure neovim

{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [ 
      imagemagick
      vimPlugins.vim-markdown-toc
      vimPlugins.rocks-nvim
      markdownlint-cli2
      nixfmt-classic
    ];
  };
}
