{ ... }: {
  programs.zsh = {
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "$HOME/.zsh/zsh_history";
    };
  };

  home.file.".zsh" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

}
