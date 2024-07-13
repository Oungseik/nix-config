{ pkgs, ... }:
let
  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "yazi";
    rev = "9bfdccc2b78d7493fa5c5983bc176a0bc5fef164";
    sha256 = "0pkq5pw8ji40jv8xhxmpvwys4pg783gshmbnsi1wp68r79czsrbb";
  };
in {

  programs.yazi = {
    enableZshIntegration = true;

    settings = {
      manager = { show_hidden = false; };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };

    };

    theme = builtins.fromTOML
      (builtins.readFile "${catppuccin}/themes/macchiato.toml");
  };
}
