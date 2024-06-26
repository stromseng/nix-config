{
  services = {
    flatpak = {
      enable = true;

      update.onActivation = true;
      # update.auto = {
      #   enable = true;
      #   onCalendar = "daily"; # Default value
      # };
      uninstallUnmanaged = true;

      packages = [
        {
          appId = "com.discordapp.Discord";
          origin = "flathub";
        }
        "io.github.brunofin.Cohesion"
        "com.sindresorhus.Caprine"
        "org.gimp.GIMP"
        "md.obsidian.Obsidian"
        "com.spotify.Client"
        "com.mattjakeman.ExtensionManager"
        "com.usebottles.bottles"
        "com.slack.Slack"
        "com.getpostman.Postman"
      ];
    };
  };
}
