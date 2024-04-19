# This file (and the global directory) holds config that i use on all hosts
{
  inputs,
  outputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locale.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  # Nix helper
  programs.nh = {
    enable = true;
    flake = "/home/magnus/nix-config";
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    curl
    vscode
    firefox
    nixpkgs-fmt # nix formatter
    nixd # Nix LSP
    nodejs_20
    python3
  ];
}
