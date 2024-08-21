{...}: {
  programs = {
    nushell = {
      enable = true;
      # for editing directly to config.nu
      extraConfig = ''
      '';
    };

    starship = {
      enable = true;
    };
  };
}
