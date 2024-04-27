{ inputs, lib, pkgs, config, outputs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    # Set your username
    username = lib.mkDefault "magnus";
    homeDirectory = lib.mkDefault "/home/magnus";

    # Add stuff for your user as you see fit:
    # programs.neovim.enable = true;
    # home.packages = with pkgs; [ steam ];
    packages = [ ];

    activation.createRepoDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p ~/repos/
    '';
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Magnus Alexander Strømseng";
    userEmail = "magnus.stromseng@gmail.com";
  };

  programs.gh.enable = true;
  # run `gh auth login` to login on a new machine




  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

}
