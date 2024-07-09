{ pkgs, ... }: {
  gtk = {
    enable = true;

    # theme = {
    # };

    iconTheme = {
      name = "Catppuccin-Macchiato";
      package = pkgs.catppuccin-gtk-theme;
    };
    # cursorTheme = {};

    font.name = "Roboto";
    font.size = 10;

  };
}

