{ pkgs, ... }:
{
  programs.zellij = {
    settings = {
      theme = "catppuccin-macchiato";
      default_layout = "compact";
    };
  };
}
