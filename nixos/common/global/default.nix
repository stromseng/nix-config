# This file (and the global directory) holds config that i use on all hosts
{ inputs
, outputs
, pkgs
, ...
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

  # Enable networking
  networking.networkmanager.enable = true;

  # Nix helper https://github.com/viperML/nh
  programs.nh = {
    enable = true;
    flake = "/home/magnus/nix-config";
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    vscode
    firefox
    nixpkgs-fmt # nix formatter
    nixd # Nix LSP
    nodejs_20
    docker
    docker-compose
    rustup
    gcc # C compiler, needed for rust-analyzer
    mise # dev env setup tool
    go # Go programming language
    nerdfonts # Nerd fonts
    libreoffice
  ];

  programs.steam.enable = true;

  # Adding binary cache server
  nix.settings = {

    substituters = [
      # nix community's cache server
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      # nix community's cache server public key
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  virtualisation.docker.enable = true;
}
