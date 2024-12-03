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

    plugins = {
      inherit starship;
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
