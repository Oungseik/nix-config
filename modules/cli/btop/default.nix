{ ... }:
{
  programs.btop = {

    settings = {
      color_theme = "noctalia";
      vim_keys = true;
    };
  };

  home.file.".config/btop/themes" = {
    source = ./themes;
    recursive = true;
  };
}
