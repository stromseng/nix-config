# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{pkgs, ...}: let
  inherit (pkgs) lib;
in rec {
  # example = pkgs.callPackage ./example { };
  surrealist2 = pkgs.callPackage ./surrealist2 { };
}
