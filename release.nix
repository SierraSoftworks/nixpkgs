{
    nixpkgsSrc ? <nixpkgs>
}:

let
    nixpkgs = import nixpkgsSrc {
        overlays = [
            (import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz))
            (import ./default.nix)
        ];
    };

    jobs = {
        git-tool = nixpkgs.git-tool;
        grey = nixpkgs.grey;
    };
in jobs