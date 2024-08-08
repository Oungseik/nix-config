### Check output files

```sh
cd $(nix build nixpkgs#bibata-cursors --print-out-path --no-link)

nix run nixpkgs#exa -- --tree --level 4
```

---

### Get hash

```sh
nix shell nixpkgs#nix-prefetch

nix-prefetch-url <url>

nix-prefetch-git <github-url>

```

toggable module

```nix
# module1.nix
{ pkgs, lib, config, ... }: {

    options = {
    module1.enable =
      lib.mkEnableOption "enables module1";
    };

    config = lib.mkIf config.module1.enable {
    option1 = 5;
    option2 = true;
    };
}

```
