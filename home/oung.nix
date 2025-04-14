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
    zoxide.enable = true;
    zsh.enable = true;
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono

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
    gdb
    ghc
    go
    google-chrome
    gnumake
    grim
    haskellPackages.haskell-language-server
    hurl
    hyprlock
    hyprpaper
    hyprpolkitagent
    jq
    mongodb-compass
    nekoray
    neovim
    nix-prefetch-git
    nodejs_22
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

    slack

    # vscode
    vscode-fhs
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
