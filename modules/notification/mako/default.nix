{ config, ... }:
{
  services.mako = with config.colorScheme.palette; {
    # anchor = "top-right";
    layer = "overlay";

    borderRadius = 4;
    borderSize = 2;

    font = "JetBrainsMono NF 11";
    padding = "5";

    backgroundColor = "#${base01}";
    textColor = "#${base05}"; # maybe base04
    borderColor = "#${base0D}";
    progressColor = "over #${base02}";
    maxIconSize = 40;
    # defaultTimeout = 20000;
    groupBy = "summary";

    extraConfig = ''
      [urgency=high]
      border-color=#${base09}

      [grouped]
      format=<b>%s</b>\n%b
    '';
  };
}
