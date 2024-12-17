{ pkgs, inputs, ... }:
{
  home = {
    username = "oung";
    homeDirectory = "/home/oung";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/cli
    ../modules/editors
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
    neovide.enable = false;
    wofi.enable = true;
    tmux.enable = true;
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
    inputs.nixvim.packages.${system}.default

    age
    bat
    brightnessctl
    deja-dup
    evince
    eww
    exercism
    fd
    firefox
    gammastep
    ghc
    go
    google-chrome
    brave
    gnumake
    grim
    haskellPackages.haskell-language-server
    hurl
    hyprlock
    hyprpaper
    jq
    mongodb-compass
    nekoray
    nix-prefetch-git
    nodejs_20
    openssl
    pavucontrol
    pcsx2
    pkg-config
    playerctl
    proxychains
    ripgrep
    slurp
    ssh-to-age
    stack
    tmux
    tun2socks
    unzip
    vlc
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
