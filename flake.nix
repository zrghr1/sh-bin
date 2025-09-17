{
  description = "My shell scripts";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    package = pkgs.stdenv.mkDerivation {
      pname = "sh-bin";
      version = "1.0.0";
      src = ./.;
      installPhase = ''
        mkdir -p $out/bin
        cp src/* $out/bin/
        chmod +x $out/bin/*
      '';
    };
  in {
    packages.${system}.sh-bin = package;

    nixosModules.default = { config, lib, pkgs, ... }:
      import ./modules/nixosModule.nix {
        inherit config lib pkgs;
        config.programs.sh-bin.package = package;
      };
  };
}
