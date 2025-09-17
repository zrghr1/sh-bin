{ config, lib, pkgs, ... }:
let
  inherit(lib) mkEnableOption mkIf;
  cfg = config.programs.sh-bin;

  package = pkgs.stdenv.mkDerivation {
    pname = "sh-bin";
    version = "1.0.0";
    src = ./../src;
    installPhase = ''
      mkdir -p $out/bin
      cp * $out/bin/
      chmod +x $out/bin/*
    '';
  };
in
{
  options.programs.sh-bin = {
    enable = mkEnableOption "Enable sh-bin scripts";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      package
    ];
  };
}
