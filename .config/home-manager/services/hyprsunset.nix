{
  systemd.user.services.hyprsunset = {
    Unit = {
      Description = "Adjust Hyprsunset Temperature Gradually";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "/home/%u/.config/scripts/hyprsunset.sh";
      Environment = [
        "DISPLAY=:0"
        "XDG_RUNTIME_DIR=/run/user/%U"
      ];
    };
    Install.WantedBy = [ "default.target" ];
  };
}
