{ ... }:
{
  programs.alacritty.theme = "kanagawa_wave";
  programs.alacritty.settings = {
    font = {
      size = 14;
      normal = {
        family = "ZedMono Nerd Font";
        style = "Regular";
      };
      offset.x = 0;
      offset.y = 0;
    };

    keyboard.bindings = [
      {
        action = "CreateNewWindow";
        key = "N";
        mods = "Shift|Control";
      }
    ];

    window = {
      opacity = 0.95;
    };
  };
}
