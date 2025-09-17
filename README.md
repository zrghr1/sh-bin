# `sh-bin`
---
Repo for custom utility scripts for my NixOS system. Might be useful for other systems too.

## Usage on NixOS
---
Simply add this to your `flake.nix`
```nix
{
    # ...
    inputs = {
        sh-bin.url = "github:zrghr1/sh-bin";
    };
}
```
Then import the module and enable it in your `configuration.nix`
```nix
{ inputs, ... }
{
    imports = [ inputs.sh-bin.nixosModules.default ];

    programs.sh-bin.enable = true;
}
```

## Usage on other distros
---
Scripts can be found in `./src`.
