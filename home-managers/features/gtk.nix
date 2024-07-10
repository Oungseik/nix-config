{ pkgs, ... }: {
  gtk = {
    enable = true;

    # theme = {
    # };

    iconTheme = {
      name = "Rose-Pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    # cursorTheme = {};

    font.name = "Roboto";
    font.size = 10;

  };
}

