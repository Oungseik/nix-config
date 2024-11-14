{ pkgs, inputs, ... }:
{
  home = {
    username = "saitama";
    homeDirectory = "/home/saitama";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../modules/cli
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {
    tmux.enable = true;
  };

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "ZedMono" ]; })
    inputs.nixvim.packages.${system}.default

    bat
    brightnessctl
    ripgrep

    nix-prefetch-git
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    RUSTUP_TOOLCHAIN = "stable";
  };

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
