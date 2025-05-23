{ pkgs, inputs, ... }:
{
  home = {
    username = "saitama";
    homeDirectory = "/home/saitama";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/cli
    ../modules/terminals
    ../modules/themes

    ../modules/window-managers
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {
    starship.enable = true;
    tmux.enable = true;
    zsh.enable = true;
  };

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "ZedMono" ]; })
    inputs.nixvim.packages.${system}.default

    # necessary
    bat
    brightnessctl
    bzip2
    nodejs_18
    ripgrep
    polybar

    nix-prefetch-git

    libglvnd

    # optional for testCanvas
    ffmpeg
    mongodb-compass
    redis
    rethinkdb
  ];

  services = { };

  xsession.windowManager = {
    bspwm.enable = false;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    RUSTUP_TOOLCHAIN = "stable";
  };

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
