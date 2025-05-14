{ config, ... }:
{
  services.mako = with config.colorScheme.palette; {
    settings = {
      # anchor = "top-right";
      layer = "overlay";

      border-radius = 4;
      border-size = 2;

      font = "JetBrainsMono NF 11";
      padding = "5";

      background-color = "#${base01}";
      text-color = "#${base05}"; # maybe base04
      border-color = "#${base0D}";
      progress-color = "over #${base02}";
      max-icon-size = 40;
      # default-timeout = 20000;
      group-by = "summary";
    };
  };
}
