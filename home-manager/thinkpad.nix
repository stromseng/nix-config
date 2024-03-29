{ inputs, lib, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/zsh.nix
    # ./features/desktop/hyprland.nix
    ./features/desktop/gnome.nix
  ];

}
