{pkgs, ...} : {
  environment.systemPackages = with pkgs; [
    appimage-run
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
    android-studio
    figma-linux # Unofficial Figma client
    bc # winapps requirement
    freerdp3 # winapps requirement
    google-chrome
    jetbrains.rust-rover
    usbimager
    bun
  ];

  # Enable AppImages
  programs.appimage.binfmt = true;

  # Nix helper https://github.com/viperML/nh
  programs.nh = {
    enable = true;
    flake = "/home/magnus/nix-config";
  };

  programs.steam.enable = true;
}