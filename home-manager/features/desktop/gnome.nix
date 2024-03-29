{ pkgs, ... }: {
  dconf.settings = {
    "org/gnome/shell" = {

      favorite-apps = [
        "firefox.desktop"
        "code.desktop"
        "org.gnome.Terminal.desktop"
        "org.gnome.Nautilus.desktop"
      ];



      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
        "dash-to-panel@jderose9.github.com"
        "sound-output-device-chooser@kgshank.net"
        "space-bar@luchrioh"
      ];
    };

  };
  home.packages = with pkgs; [
    # ...
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-panel
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.space-bar
  ];
}
