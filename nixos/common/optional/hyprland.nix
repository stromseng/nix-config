{ pkgs, ... }: {
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar # Bar
    dunst # Notifications
    libnotify # Notifications
    hyprpaper # Wallpaper daemon
    kitty # Terminal
    rofi-wayland # Application launcher
    kdePackages.polkit-kde-agent-1 # Polkit agent, used for authentication dialogs
    kdePackages.qtwayland # qt6 wayland
    libsForQt5.qt5.qtwayland


  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-wlr
  ];
}
