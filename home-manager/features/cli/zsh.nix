{...}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      syntaxHighlighting.highlighters = ["main" "brackets"];
      autocd = true;
      defaultKeymap = "emacs";
      shellAliases = {
        gs = "git status";
        ga = "git add";
        gaa = "git add --all";
        gc = "git commit";
        gp = "git push";
        gl = "git pull";
        gco = "git checkout";
        gd = "git diff";

        cat = "bat";
        ls = "eza";
      };
      initExtraBeforeCompInit = ''
        # Download Znap, if it's not there yet.
        [[ -r ~/repos/znap/znap.zsh ]] ||
            git clone --depth 1 -- \
                https://github.com/marlonrichert/zsh-snap.git ~/repos/znap
        source ~/repos/znap/znap.zsh  # Start Znap


      '';
      initExtra = ''
        # `znap source` starts plugins.
        znap source zsh-users/zsh-autosuggestions
        znap source marlonrichert/zsh-autocomplete
        znap source zsh-users/zsh-completions
        znap source zsh-users/zsh-history-substring-search
        znap source MichaelAquilina/zsh-you-should-use
        znap source zsh-users/zsh-syntax-highlighting

        # Rust cargo
        znap source "$HOME/.cargo/env"

        # Load starship prompt
        eval "$(starship init zsh)"
      '';
    };
    # A modern ls replacement
    eza = {
      enable = true;
    };
    # A modern cat replacement
    bat = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
  };
}
