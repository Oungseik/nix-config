{ pkgs, ... }: {

  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };

    cursorTheme = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    # iconTheme.package = gruvboxPlus;
    # iconTheme.name = "GruvboxPlus";
  };

  qt = {
    enable = true;
    platformTheme = "gtk";

    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
