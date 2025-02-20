{ pkgs, ... }: {
  home.packages = with pkgs; [
    rustup
    sccache
    cargo-nextest
    cargo-watch
    cargo-tauri
    cargo-make
    sqlx-cli
  ];
}
