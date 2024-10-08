{pkgs, ...}: {
  # Do `dconf watch /` to see which keys to set when changing settings

  # Dconf key format
  # Path: org/gnome/shell
  # Name: favorite-apps
  # Value: [firefox.desktop, ...]

  dconf.settings = {
    "org/gnome/shell" = {
      disable-extension-version-validation = true;
    };

    "/org/gnome/desktop/interface" = {
      gtk-enable-primary-paste = false;
    };

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
      switch-windows = ["<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = ["<Super>Tab"];
      switch-applications-backward = ["<Shift><Super>Tab"];
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-right = ["<Alt><Super>Right"];
      switch-to-workspace-left = ["<Alt><Super>Left"];
      move-to-workspace-left = ["<Control><Super>Left"];
      move-to-workspace-right = ["<Control><Super>Right"];
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };
    "org/gnome/desktop/interface" = {
      cursor-theme = "Adwaita";
      icon-theme = "Papirus";
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "code.desktop"
        #"org.gnome.Ptyxis.desktop"
        "org.gnome.Console.desktop"
        "org.gnome.Nautilus.desktop"
        "io.github.dvlv.boxbuddyrs.desktop"
      ];

      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        #"dash-to-panel@jderose9.github.com"
        #"trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
        "space-bar@luchrioh"
        "dash-to-dock@micxgx.gmail.com"
        "gSnap@micahosborne"
        "noannoyance-fork@vrba.dev"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "logomenu@aryan_k"
        "tailscale@joaophi.github.com"
      ];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      click-action = "focus-or-previews";
      intellihide-mode = "ALL_WINDOWS";
      show-trash = false;
    };
    "org/gnome/shell/extensions" = {
      "dash-to-panel/panel-element-positions" = ''
        {"0":[{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"showAppsButton","visible":true,"position":"centerMonitor"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
      '';

      "gsnap/use-modifier" = true;

      "Logo-menu/menu-button-icon-image" = 18;
      "Logo-menu/symbolic-icon" = false;
      "Logo-menu/use-custom-icon" = false;
      "Logo-menu/menu-button-terminal" = "ptyxis";
    };
  };

  home.file.".local/share/gnome-shell/extensions/gSnap@micahosborne/layouts.json" = {
    source = ../../../dotfiles/gsnap.json;
  };

  home.packages = with pkgs; [
    #gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-dock
    gnomeExtensions.space-bar
    papirus-icon-theme
    gnomeExtensions.gsnap
    gnomeExtensions.noannoyance-fork
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.logo-menu
    gnomeExtensions.tailscale-qs
  ];
}
