{
  services = {
    flatpak = {
      enable = true;

      update.auto.enable = false;
      uninstallUnamanged = true;

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
      ];
    };
  };
}
