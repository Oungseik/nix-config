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
    brightnessctl
    eww
    exercism
    fd
    gammastep
    gnumake
    nix-prefetch-git
    nix-inspect
    pavucontrol
    pcsx2
    playerctl
    ssh-to-age
    tun2socks
    tlaplusToolbox
    vlc

    waybar
    rofi-wayland
    slurp
    jq
    hyprlock
    hyprpaper
    hyprpolkitagent
    wl-clipboard
    grim
    deja-dup
    evince
    tmux

    firefox
    google-chrome

    unzip
    zip

    vscode-fhs
    slack
    signal-desktop
    telegram-desktop
    nekoray
    sshuttle

    neovim
    neovide
    ripgrep
    hurl
    lua-language-server
    stylua
    typescript
    typescript-language-server
    svelte-language-server
    vscode-langservers-extracted
    nodejs_24
    bun
    nil
    nixfmt-rfc-style
    gopls
    tombi

    gdb
    rustup
    openssl
    pkg-config

    sqlite
    go
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    RUSTUP_TOOLCHAIN = "stable";
  };

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
