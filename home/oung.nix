{ pkgs, inputs, ... }:
{
  home = {
    username = "oung";
    homeDirectory = "/home/oung";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/cli
    ../modules/notification
    ../modules/terminals
    ../modules/themes
    ../modules/xresources

    ../modules/programs/wofi
    ../modules/programs/zathura
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  programs = {
    fastfetch.enable = true;
    wofi.enable = true;
  };

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    inputs.nixvim.packages.${system}.default

    age
    bat
    brightnessctl
    btop
    deja-dup
    evince
    eww
    fd
    firefox
    gammastep
    go
    google-chrome
    gnumake
    grim
    hyprlock
    hyprpaper
    jq
    lunarvim
    nekoray
    nix-prefetch-git
    nodejs_20
    pavucontrol
    pcsx2
    playerctl
    proxychains
    ripgrep
    rustup
    slurp
    ssh-to-age
    tmux
    unzip
    vscode
    waybar
    wl-clipboard
    zig
    zls
    zip
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    RUSTUP_TOOLCHAIN = "stable";
  };

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
