{ pkgs, ... }: {
  # Do `dconf watch /` to see which keys to set when changing settings
  dconf.settings = {
    "org/gnome" = {
      "desktop" = {
        "wm" = {
          "preferences/button-layout" = "appmenu:minimize,maximize,close";

          keybindings = {
            switch-to-workspace-right = [ "<Alt><Super>Right" ];
            switch-to-workspace-left = [ "<Alt><Super>Left" ];
            move-to-workspace-left = [ "<Control><Super>Left" ];
            move-to-workspace-right = [ "<Control><Super>Right" ];
          };
        };
        "interface" = {
          show-battery-percentage = true;
        };
      };
      "shell" = {

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
          "space-bar@luchrioh"
          "forge@jmmaranan.com"

        ];

        "extensions/dash-to-panel/panel-element-positions" = ''
          {"0":[{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"showAppsButton","visible":true,"position":"centerMonitor"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
        '';
      };

    };
    home.packages = with pkgs; [
      gnomeExtensions.tray-icons-reloaded
      gnomeExtensions.vitals
      gnomeExtensions.dash-to-panel
      gnomeExtensions.space-bar
      gnomeExtensions.forge
    ];
  };
}
