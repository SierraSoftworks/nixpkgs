# nixpkgs
**Nix packages for software published by Sierra Softworks**

This repository contains the Sierra Softworks Nix overlay, which allows
you to install our software using the Nix package manager.

## Usage
Here is an example of how to use the overlay to install the `grey` and `git-tool` commands into a `nix-shell`.

```nix
let
  sierra_overlay = import (builtins.fetchTarball https://github.com/SierraSoftworks/nixpkgs/archive/main.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ sierra_overlay ]; };
in
  with nixpkgs;
  stdenv.mkDerivation {
    name = "sierra_overlay_shell";
    buildInputs = [
      nixpkgs.grey
      nixpkgs.git-tool
    ];
  }
```
