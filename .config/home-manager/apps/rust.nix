{ pkgs, ... }: {
  home.packages = with pkgs; [
    rustup
    sccache
    cargo-nextest
    cargo-watch
    cargo-tauri
    cargo-make
    sqlx-cli
    mold
  ];

  home.sessionVariables = {
    RUSTC_WRAPPER = pkgs.lib.getExe pkgs.sccache;
    RUSTFLAGS = "-C link-arg=-fuse-ld=mold";
    CARGO_PROFILE_RELEASE_LTO = "true";
  };
}
