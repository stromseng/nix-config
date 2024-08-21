{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./global
    ./features/cli/zsh.nix
    ./features/cli/starship.nix
    ./features/desktop/gnome.nix
  ];

  home = {
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = lib.mkDefault "24.05";
  };
}
