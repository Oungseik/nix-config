{config, pkgs, ...}:
{
  home.username = "oung";
  home.homeDirectory = "/home/oung";

  imports = [
    ../hyprland
    ../programs
  ];

  wayland.windowManager.hyprland.enable = true;

  programs = {
    starship.enable = true;
    git.enable = true;
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 96;
  };

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    jq
    unzip
    zip
  ];

  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
