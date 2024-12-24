{ pkgs, ... }:
let
  plugins-repo = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "c7feb90930a20ac8782305ed28ab4d9715124833";
    hash = "sha256-Q+i1U+2uNlThf3+fFMUkWk9m7ZJ4z0mwVsrmqPFKVcE=";
  };
  starship = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "9c37d37099455a44343f4b491d56debf97435a0e";
    sha256 = "sha256-wESy7lFWan/jTYgtKGQ3lfK69SnDZ+kDx4K1NfY4xf4=";
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
