{ pkgs, ... }: {
  home.packages = with pkgs; [ eza ];
  programs.zsh = {
    autocd = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza";
      la = "eza -la";

    };

    history = {
      size = 10000;
      path = "$HOME/.zsh/zsh_history";
    };
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
