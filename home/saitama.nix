{ pkgs, inputs, ... }:
{
  home = {
    username = "saitama";
    homeDirectory = "/home/saitama";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {};

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "ZedMono" ]; })
    inputs.nixvim.packages.${system}.default

  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    RUSTUP_TOOLCHAIN = "stable";
  };

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
