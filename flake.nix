{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
  }: let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    packages = eachSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.stdenvNoCC.mkDerivation {
        name = "astroclub-site";
        src = pkgs.lib.cleanSource self;

        nativeBuildInputs = [(pkgs.python3.withPackages (ps: with ps; [jupyter-book]))];
        buildPhase = ''
          jupyter-book build .
        '';
        installPhase = ''
          cp -r _build/html $out
        '';

        meta = with pkgs.lib; {
          platforms = platforms.all;
        };
      };
    });
  };
}
