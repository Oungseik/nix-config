{ pkgs, ... }:
{
  imports = [
    ./mpd-mpris.nix
    ./mpd.nix
  ];

  services.mpd.enable = true;
  services.mpd-mpris.enable = true;

}
