{
    nixpkgsSrc ? <nixpkgs>,
    defaultTargets ? [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ]
}:

let
    lib = (import nixpkgsSrc { }).lib;
    builder = path: target:
        lib.getAttrFromPath path (import nixpkgsSrc {
            overlays = [
                import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz)
                import ./default.nix
            ];
        });
    build = path: { targets ? defaultTargets }:
        lib.genAttrs targets builder;
in {
    git-tool = build ["git-tool"];
    grey = build ["grey"];
}