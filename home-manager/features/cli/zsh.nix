{ ... }: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      syntaxHighlighting.highlighters = [ "main" "brackets" ];
      autocd = true;
      defaultKeymap = "emacs";
      shellAliases = { };
      initExtraBeforeCompInit = ''
      '';
      initExtra = ''
        # Download Znap, if it's not there yet.
        [[ -r ~/repos/znap/znap.zsh ]] ||
            git clone --depth 1 -- \
                https://github.com/marlonrichert/zsh-snap.git ~/repos/znap
        source ~/repos/znap/znap.zsh  # Start Znap


        # `znap source` starts plugins.
        znap source marlonrichert/zsh-autocomplete
        znap source zsh-users/zsh-autosuggestions
        znap source zsh-users/zsh-syntax-highlighting
        znap source zsh-users/zsh-completions        
      '';
    };
  };
}
