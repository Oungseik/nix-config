{...}: {
  programs.kitty = {
    font.name = "JetBrainsMono NF";
    font.size = 13;

    theme = "Catppuccin-Macchiato";
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
