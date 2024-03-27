{ inputs, lib, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/zsh.nix
  ];

}
