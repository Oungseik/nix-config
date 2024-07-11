{...}:
{
  # hyprland - Tiling compositor with the looks
  wayland.windowManager.hyprland = {
    enable = true;
    settings = { };
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
