{
  config,
  ...
}:
let
  configPath = "${config.home.homeDirectory}/nix-config/modules/window-managers/niri";
in
{
  xdg.configFile.niri.source = config.lib.file.mkOutOfStoreSymlink configPath;
}
