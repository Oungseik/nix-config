{ pkgs, inputs, lib, ... }: {
  home = {
    username = "astro";
    homeDirectory = "/home/astro";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/programs/alacritty
    ../modules/programs/kitty
    ../modules/programs/starship
    ../modules/themes
    ../modules/programs/yazi
    ../modules/programs/zsh

    ../modules/window-managers/hyprland
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {
    kitty = {
      enable = true;
      font.size = lib.mkForce 12;
    };

    starship.enable = true;
    yazi.enable = true;
    zsh.enable = true;
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

  # fonts.fontconfig.enable = true;
  # fonts.fontconfig.enableProfileFonts = true;
  home.sessionVariables = { EDITOR = "nvim"; };

  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
