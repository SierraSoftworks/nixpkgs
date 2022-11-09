self: super:
let
    pkgs = super;

    lib = super.lib // {
        maintainers = import ./maintainers.nix { inherit pkgs; };
    };
in
    with super;
rec {
    git-tool = import ./pkgs/git-tool.nix { inherit pkgs lib fetchFromGitHub rustPlatform; };
    grey = import ./pkgs/grey.nix { inherit pkgs lib fetchFromGitHub rustPlatform; };
}