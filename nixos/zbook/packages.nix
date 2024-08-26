{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mozart2
    emacs
  ];
}
