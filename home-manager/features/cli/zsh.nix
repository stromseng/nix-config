{ pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      defaultKeymap = "emacs";
      shellAliases = { };
      initExtra = ''
        rebuild () {
          sudo nixos-rebuild switch --flake .#thinkpad
        }
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
      };
    };
  };
}
