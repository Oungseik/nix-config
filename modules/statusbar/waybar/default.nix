{ ... }:
{
  programs.waybar = {
    settings = import ./awe/config.nix;
    style = import ./awe/style.nix;
  };
}
