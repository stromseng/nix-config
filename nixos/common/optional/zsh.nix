{pkgs, ...}: {
  programs = {
    zsh = {
      enable = true;
    };
  };
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [
    zsh
  ];

  # Install meslogs nf font
  fonts.packages = with pkgs; [
    meslo-lgs-nf
  ];

  # For autocompletion of system packages
  environment.pathsToLink = ["/share/zsh"];
}
