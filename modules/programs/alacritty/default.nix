{ config, ... }: {
  programs.alacritty.enable = true; 
  programs.alacritty.settings = {
    font = {
      size = 13;
      normal = {
        family = "JetBrainsMono NF";
        style = "Regular";
      };
      offset.x = 0;
      offset.y = 0;
    };

    keyboard.bindings = [
    { action = "CreateNewWindow"; key = "N"; mods = "Shift|Control"; }
    ];

    window = {
      opacity = 0.95;
    };
    
    colors = with config.colorScheme.palette; {
      indexed_colors = [
        { color = "0x${base09}"; index = 16; }
        { color = "0x${base06}"; index = 17; }
      ] ;

      bright = { 
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };

      cursor = {
        cursor = "0x${base06}";
        text = "0x${base00}";
      };

      dim = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };

      hints.end = {
        background = "0x${base0F}";
        foreground = "0x${base00}";
      };

      hints.start = {
        background = "0x${base0A}";
        foreground = "0x${base00}";
      };

      normal = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };

      primary = {
        background = "0x${base00}";
        bright_foreground = "0x${base06}";
        dim_foreground = "0x${base06}";
        foreground = "0x${base06}";
      };

      search.focused_match = {
        background = "0x${base0B}";
        foreground = "0x${base00}";
      };

      search.matches = {
        background = "0x${base0F}";
        foreground = "0x${base00}";
      };

      selection = {
        background = "0x${base06}";
        text = "0x${base00}";
      };

      vi_mode_cursor = {
        cursor = "0x${base07}";
        text = "0x${base00}";
      };
    };
  };
}
