{ ... }: {
  programs.wofi = {
    settings = {

      hide_scroll = true;
      show = "drun";
      width = "30%";
      lines = 8;
      line_wrap = "word";
      term = "alacritty";
      allow_markup = true;
      always_parse_args = false;
      show_all = true;
      print_command = true;
      layer = "overlay";
      allow_images = true;
      # sort_order = alphabetical;
      gtk_dark = true;
      prompt = "Search...";
      image_size = 24;
      display_generic = true;
      location = "center";
      key_expand = "Tab";
      insensitive = true;
    };
  };

  home.file.".config/wofi/style.css".source = ./style.css;
}
