{ config, lib, pkgs, ... }:
let
  inherit(lib) mkEnableOption mkIf;
  cfg = config.programs.sh-bin;
in
{
  options.programs.sh-bin = {
    enable = "Enable sh-bin scripts";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      cfg.package
    ];
  };
}
