{ pkgs, ... }: {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome-extension-manager
    gnome.gnome-software
    pkgs.gnome3.gnome-tweaks
    gnome.adwaita-icon-theme
  ];
}
