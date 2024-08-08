{ pkgs, ... }: {
  programs.zathura = {
    enable = true;
    mappings = {
      "[normal] <C-i>" = "zoom in";
      "[normal] <C-o>" = "zoom out";
      "[normal] <S-+>" = "zoom in";
      "[normal] <S-->" = "zoom out";
    };
    options = import ./theme/catppuccin-latte.nix;
    extraConfig = '''';
  };
}
