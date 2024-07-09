{ pkgs, inputs, ...}:
{
  home.username = "oung";
  home.homeDirectory = "/home/oung";

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../../home-managers/hyprland
    ../../home-managers/programs
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  wayland.windowManager.hyprland.enable = true;

  programs = {
    alacritty.enable = true;
    firefox.enable = true;
    git.enable = true;
    starship.enable = true;
    zsh.enable = true;
  };

  services = {
    mako.enable = true;
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

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
