{ config, ... }:
{
  programs.btop = {

    settings = {
      color_theme = "/home/${config.home.username}/.config/btop/themes/catppuccin_macchiato.theme";
      vim_keys = true;
    };
  };

  home.file.".config/btop/themes" = {
    source = ./themes;
    recursive = true;
  };
}
