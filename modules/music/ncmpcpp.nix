{ ... }: {
  programs.ncmpcpp = {
    enable = true;
    bindings = [ ];

    settings = {
      ncmpcpp_directory = ~/.config/ncmpcpp;
      lyrics_directory = ~/.local/share/lyrics;
    };
  };
}
