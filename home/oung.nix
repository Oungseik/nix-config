{ pkgs, inputs, ... }: {
  home = {
    username = "oung";
    homeDirectory = "/home/oung";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/programs/eza
    # ../modules/programs/starship
    ../modules/programs/wofi
    ../modules/programs/yazi

    ../modules/terminals
    ../modules/themes
    ../modules/xresources
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {
    fastfetch.enable = true;
    wofi.enable = true;
    yazi.enable = true;
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
