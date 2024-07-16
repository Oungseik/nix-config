{ pkgs, inputs, ... }: {
  home = {
    username = "oung";
    homeDirectory = "/home/oung";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/programs/alacritty
    # ../modules/programs/starship
    ../modules/programs/wofi
    ../modules/programs/yazi

    ../modules/themes
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {
    fastfetch.enable = true;
    wofi.enable = true;
    yazi.enable = true;
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 96;
  };

  home.packages = with pkgs; [
    inputs.nixvim.packages.${system}.default
    # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    age
    go
    ssh-to-age
    jq
    ripgrep
    unzip
    zip
  ];

  home.sessionVariables = { EDITOR = "nvim"; };

  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
