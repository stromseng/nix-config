{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the SDDM display manager and the Plasma 6 desktop.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # qt = {
  #   enable = true;
  #   platformTheme = "gnome";
  #   style = "adwaita-dark";
  # };

  environment.systemPackages = with pkgs; [];
}
