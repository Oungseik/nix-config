{lib, config, options, pkgs, ...}:
{
  # Importing other Modules
  imports = [
    ./xxx.nix
  ];

  foo.bar.enable = true;
}
