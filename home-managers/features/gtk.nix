{ pkgs, ... }: {
  gtk = {
    enable = true;

    # theme = {
    # };

    iconTheme = {
      name = "Colorful-Dark";
      package = pkgs.colorful-dark-gtk-theme;
    };
    # cursorTheme = {};

    font.name = "Roboto";
    font.size = 10;

  };
}

