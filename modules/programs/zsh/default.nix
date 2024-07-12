{ ... }: {

  programs.zsh = {

  };

  home.file.".zsh" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

}
