{ pkgs, ... }:
{
  imports = [
    ./mpd-mpris.nix
    ./mpd.nix
    ./ncmpcpp.nix
  ];
}
