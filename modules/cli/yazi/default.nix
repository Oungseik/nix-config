{ pkgs, ... }:
let
  plugins-repo = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "b6597919540731691158831bf1ff36ed38c1964e";
    hash = "sha256-clyhjvIhhSaWDLGDE+dA8+lxE3fZwo9GI1pVRDQ4tR0=";
  };
  starship = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "247f49da1c408235202848c0897289ed51b69343";
    sha256 = "sha256-0J6hxcdDX9b63adVlNVWysRR5htwAtP5WhIJ2AK2+Gs=";
  };
in
# yamb = pkgs.fetchFromGitHub {
#   owner = "h-hg";
#   repo = "yamb.yazi";
#   rev = "0598b8defc21ac7231e584115c3aa330f0310db4";
#   hash = "sha256-Mw+CUyy8sN76NJNy+Xt0HwH6tD/gxqNvyIYKqpWUKMs=";
# };
{

  programs.yazi = {
    enableZshIntegration = true;

    settings = {
      manager = {
        show_hidden = false;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };

    theme = import ./themes/catppuccin.nix;
    keymap = {
      input.keymap = [ ];
      manager.keymap = [ ];
    };

    plugins = {
      inherit starship;
      # inherit yamb;
      full-border = "${plugins-repo}/full-border.yazi";
    };

    initLua = ''
      require("full-border"):setup {
      	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
      	type = ui.Border.ROUNDED,
      }

      require("starship"):setup()
    '';
  };
}
