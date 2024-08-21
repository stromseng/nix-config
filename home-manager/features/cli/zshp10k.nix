{pkgs, ...}: {
  home.file.".p10k.zsh" = {
    source = ../../../dotfiles/.p10k.zsh;
  };
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      syntaxHighlighting.highlighters = ["main" "brackets"];
      autocd = true;
      defaultKeymap = "emacs";
      shellAliases = {};
      initExtraBeforeCompInit = ''
        # p10k instant prompt
        P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
        [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
      '';
      initExtra = ''
        rebuild-nixos () {
          sudo nixos-rebuild switch --flake ~/nix-config
        }

        rebuild-hm () {
          home-manager switch --flake ~/nix-config
        }

        rebuild () {
          rebuild-nixos
          rebuild-hm
        }

        # Powerlevel10k configuration
        source ~/.p10k.zsh
      '';
      zplug = {
        enable = true;
        plugins = [
          {name = "zsh-users/zsh-autosuggestions";} # Simple plugin installation
          {
            name = "romkatv/powerlevel10k";
            tags = ["as:theme" "depth:1"];
          } # Installations with additional options. For the list of options, please refer to Zplug README.
        ];
      };
    };
  };
}
