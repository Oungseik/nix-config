{ pkgs, ... }: {
  home.packages = with pkgs; [ exa ];
  programs.zsh = {
    autocd = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "exa";
      la = "exa -la";

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

  home.file.".zsh" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

}
