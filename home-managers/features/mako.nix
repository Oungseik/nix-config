{config, ...}: let
  palette = config.colorScheme.palette;
in {

  services.mako = {
    backgroundColor = "#${palette.base01}";
    # foregroundColor = "#${palette.base0E}";
    textColor =  "#${palette.base04}";


    borderRadius = 5;
    borderSize = 2;
    layer = "overlay";
  };
}
