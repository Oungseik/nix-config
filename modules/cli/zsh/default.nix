{ pkgs, ... }:
{
  home.packages = with pkgs; [ eza ];
  programs.zsh = {
    autocd = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza";
      la = "eza -la";
      vi = "nvim";
      nix = "nix --experimental-features 'nix-command flakes'";
      home-manager = "home-manager --experimental-features 'nix-command flakes'";
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh/zsh_history";
    };

    initExtra = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # home.file.".zsh" = {
  #   source = ./scripts;
  #   recursive = true;
  #   executable = true;
  # };
}
