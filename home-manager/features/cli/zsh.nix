{ pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      autosuggestions.enable = true;
      defaultKeymap = "emacs";
      ohMyZsh = {
        enable = true;

      };
    };
  };
  users.defaultUserShell = pkgs.zsh;
}
