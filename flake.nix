{
  description = "My shell scripts";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }: 
  {
    nixosModules.default = import ./modules/nixosModule.nix;
  };
}
