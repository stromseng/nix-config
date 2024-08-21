{lib, ...}: {
  imports = [
    ./global
    ./features/cli/zsh.nix
    ./features/cli/nu.nix
    ./features/desktop/gnome.nix
    ./features/cli/starship.nix
  ];

  home = {
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = lib.mkDefault "23.11";
  };
}
