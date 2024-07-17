{ pkgs, ... }: {

  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    # iconTheme.package = gruvboxPlus;
    # iconTheme.name = "GruvboxPlus";

    font = {
      name = "Roboto";
      size = 12;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";

    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
