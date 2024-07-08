{config, pkgs, ...}:
{
  home.username = "oung";
  home.homeDirectory = "/home/oung";

  imports = [
    ../hyprland
    ../programs
  ];

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 96;
  };

  home.packages = with pkgs; [
    jq
    unzip
    zip
  ];



  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
