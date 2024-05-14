{ pkgs, ... }: {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Disable automatic suspend because of computer not waking from suspend
    displayManager.gdm.autoSuspend = false;
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome-extension-manager
    gnome.gnome-software
    gnome3.gnome-tweaks
    gnome.adwaita-icon-theme
  ];
}
