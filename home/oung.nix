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
    inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.default
    (import ../pkgs/proxy-tunnel/default.nix { inherit pkgs; })

    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono

    age
    brightnessctl
    eww
    exercism
    fd
    gnupg
    (pass.withExtensions (
      subpkgs: with subpkgs; [
        pass-audit
        pass-otp
        pass-genphrase
      ]
    ))
    pinentry-curses
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
    rofi
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
    brave

    unzip
    zip

    vscode-fhs
    code-cursor-fhs
    slack
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
    markdown-oxide
    vale

    gdb
    rustup
    openssl
    pkg-config

    sqlite
    go
    golangci-lint
    go-tools
    delve
    gleam
    ngrok
    google-cloud-sdk

    colmena
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    RUSTUP_TOOLCHAIN = "stable";
  };

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
