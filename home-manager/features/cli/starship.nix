{ self, ... }: {
  # # handle prompt in zsh.nix instead, to use znap
  programs.starship = {
    enable = true;
    enableZshIntegration = false;
  };
  home.file.".config/starship.toml".source = ../../../dotfiles/starship.toml;
}
