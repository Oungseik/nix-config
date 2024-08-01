{ ... }: {
  programs.kitty = {
    font.name = "JetBrainsMono NF";
    font.size = 13;

    theme = "Catppuccin-Macchiato";

    keybindings = {
      "ctrl+shift+h" = "no_op";
      "ctrl+shift+l" = "no_op";
      "ctrl+shift+x" = "no_op";
      "ctrl+shift+z" = "no_op";
      "ctrl+shift+g" = "no_op";
    };


    settings = {
      cursor_beam_thinkness = 1;
      cursor_blink_interval = 0;
      enable_audio_bell = false;

      editor = "nvim";

      repaint_delay = 20;
      input_delay = 3;
      sync_to_monitor = "yes";
    };
  };
}
