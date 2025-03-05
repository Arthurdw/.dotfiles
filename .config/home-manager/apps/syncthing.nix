{
  services.syncthing = {
    enable = true;

    settings = {
      devices = {
        "Hercules NAS" = {
          id =
            "R6FD4WR-VVOBSDI-BZCQCBE-HRHRQ2I-FGRNZH2-5IAPEHC-GZBAYEY-XBQNVAF";
          autoAcceptFolders = true;
        };
      };

      options = {
        localAnnounceEnabled = true;
        localAnnouncePort = 21027;
      };

      folders = {
        "Documents" = { path = "~/Documents/"; };
        "Downloads" = { path = "~/Downloads/"; };
        "Photos" = { path = "~/Photos/"; };
        "SSH" = { path = "~/.ssh/"; };
        "Kubeconfig" = { path = "~/.kube/"; };
      };
    };
  };
}
