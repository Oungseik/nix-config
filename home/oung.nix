{ pkgs, inputs, ...}:
{
  home.username = "oung";
  home.homeDirectory = "/home/oung";

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/programs/alacritty
    ../modules/programs/nixvim
    # ../modules/programs/starship
    ../modules/programs/yazi
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {
    yazi.enable = true;
    nixvim.enable = true;
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 96;
  };

  home.packages = with pkgs; [
    # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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
