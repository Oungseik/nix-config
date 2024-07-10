{config, ...}: {

  services.mako = {
    backgroundColor = "#${config.colorScheme.colors.base01}";
    # foregroundColor = "#${config.colorScheme.colors.base0E}";
    textColor =  "#${config.colorScheme.colors.base04}";


    borderRadius = 5;
    borderSize = 2;
    layer = "overlay";
  };
}
