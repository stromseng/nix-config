{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./global
    ./features/cli/zsh.nix
  ];

  home = {
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = lib.mkDefault "23.11";
  };
}
