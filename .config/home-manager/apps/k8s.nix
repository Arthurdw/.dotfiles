{ pkgs, ... }: { home.packages = with pkgs; [ kubectl kubetail doctl ]; }
