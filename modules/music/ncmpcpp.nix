{ ... }:
{
  programs.ncmpcpp = {
    enable = true;
    bindings = [
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "J";
        command = [
          "select_item"
          "scroll_down"
        ];
      }
      {
        key = "K";
        command = [
          "select_item"
          "scroll_up"
        ];
      }
    ];

    settings = {
      ncmpcpp_directory = "~/.config/ncmpcpp";
      lyrics_directory = "~/.local/share/lyrics";
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "Visualizer feed";
      visualizer_in_stereo = "yes";
      visualizer_type = "wave";
    };
  };
}
