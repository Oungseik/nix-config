{ ... }: {
  imports = [
    ./alacritty
    ./kitty
  ];

  programs.alacritty.enable = true;
  programs.kitty.enable = true;
}
