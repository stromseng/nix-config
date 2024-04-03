{ pkgs, ... }: {
  # Do `dconf watch /` to see which keys to set when changing settings

  # Dconf key format
  # Path: org/gnome/shell
  # Name: favorite-apps
  # Value: [firefox.desktop, ...]

  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/desktop/interface" = {
      enable-hot-corners = false;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-right = [ "<Alt><Super>Right" ];
      switch-to-workspace-left = [ "<Alt><Super>Left" ];
      move-to-workspace-left = [ "<Control><Super>Left" ];
      move-to-workspace-right = [ "<Control><Super>Right" ];
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "code.desktop"
        "org.gnome.Console.desktop"
        "org.gnome.Nautilus.desktop"
      ];

      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
        # "dash-to-panel@jderose9.github.com"
        "space-bar@luchrioh"
        "dash-to-dock@micxgx.gmail.com"
      ];

      "extensions/dash-to-panel/panel-element-positions" = ''
        {"0":[{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"showAppsButton","visible":true,"position":"centerMonitor"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
      '';

      "org/gnome/shell/extensions/dash-to-dock" = {
        intellihide-mode = "ALL_WINDOWS";
        pressure-threshold =
          0.0;
        show-trash = false;
        scroll-action = "cycle-windows";
      };
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    # gnomeExtensions.dash-to-panel
    gnomeExtensions.dash-to-dock
    gnomeExtensions.space-bar
  ];
}
