let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  sierra_overlay = import ./default.nix;
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay sierra_overlay ]; };
in
  with nixpkgs;
  stdenv.mkDerivation {
    name = "sierra_overlay_shell";
    buildInputs = [
      nixpkgs.git-tool
      nixpkgs.grey
    ];
  }