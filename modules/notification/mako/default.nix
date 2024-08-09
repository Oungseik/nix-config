{ config, ... }:
{
  services.mako = with config.colorScheme.palette; {
    # anchor = "top-right";
    layer = "overlay";

    borderRadius = 4;
    borderSize = 2;

    font = "JetBrainsMono NF 11";
    padding = "12";

    backgroundColor = "#${base01}";
    textColor = "#${base05}"; # maybe base04
    borderColor = "#${base0D}";
    progressColor = "over #${base02}";
    maxIconSize = 40;

    extraConfig = ''
      [urgency=high]
      border-color=#${base09}
    '';
  };
}
