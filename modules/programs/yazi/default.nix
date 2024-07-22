{ pkgs, ... }:
let
  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "yazi";
    rev = "9bfdccc2b78d7493fa5c5983bc176a0bc5fef164";
    sha256 = "0pkq5pw8ji40jv8xhxmpvwys4pg783gshmbnsi1wp68r79czsrbb";
  };
  plugins-repo = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "06e5fe1c7a2a4009c483b28b298700590e7b6784";
    hash = "sha256-jg8+GDsHOSIh8QPYxCvMde1c1D9M78El0PljSerkLQc=";
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

    theme = builtins.fromTOML
      (builtins.readFile "${catppuccin}/themes/macchiato.toml");

    plugins = {
      full-border = "${plugins-repo}/full-border.yazi";
      starship = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "starship.yazi";
        rev = "0a141f6dd80a4f9f53af8d52a5802c69f5b4b618";
        sha256 = "sha256-OL4kSDa1BuPPg9N8QuMtl+MV/S24qk5R1PbO0jgq2rA=";
      };
    };

    initLua = ''
    '';
  };
}
