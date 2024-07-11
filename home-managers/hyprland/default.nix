{...}:
{
  # hyprland - Tiling compositor with the looks
  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      decoration = {
        rounding = 6;
  
        blur.enable = false;
  
        drop_shadow = false;
        # shadow_rnage = 4;
        # shadow_render_power = 3;
        # col.shadow = "rgba(1a1a1acc)";

      };

    };
  };

  home.file.".config/hyprland/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hyprland/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/hyprland/wal.jpg".source = ./wal.jpg;

  home.file.".config/hyprland/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

  # wayland.windowManager.hyprland.systemd.variables = ["--all"];
}
