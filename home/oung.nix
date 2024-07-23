{ pkgs, inputs, ... }: {
  home = {
    username = "oung";
    homeDirectory = "/home/oung";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/programs/alacritty
    ../modules/programs/eza
    ../modules/programs/kitty
    # ../modules/programs/starship
    ../modules/programs/wofi
    ../modules/programs/yazi

    ../modules/themes
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {
    fastfetch.enable = true;
    kitty.enable = true;
    wofi.enable = true;
    yazi.enable = true;
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 96;
  };

  home.packages = with pkgs; [
    # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # inputs.nixvim.packages.${system}.default

    age
    go
    htop
    hyprpaper
    jq
    lunarvim
    nix-prefetch-git
    proxychains
    ripgrep
    ssh-to-age
    tmux
    unzip
    zip
  ];

  home.sessionVariables = { EDITOR = "nvim"; };

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
