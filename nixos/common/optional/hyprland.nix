{ pkgs, ... }: {
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar # Bar
    dunst # Notifications
    libnotify # Notifications
    hyprpaper # Wallpaper daemon
    kitty # Terminal
    rofi-wayland # Application launcher
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];
}
