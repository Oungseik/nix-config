{ ... }:
let domain_socket = "$HOME/.mpd/socket";
in {
  services.mpd = {
    musicDirectory = "$HOME/Music";
    playlistDirectory = "$HOME/.local/share/mpd/playlists";
    dbFile = "$HOME/.config/mpd/database";
    state_file = "$HOME/.config/mpd/state";
    sticker_file = "$HOME/.config/mpd/sticker.sql";

    extraConfig = ''
      bind_to_address		"127.0.0.1"
      bind_to_address		${domain_socket}

      user              $USER 
      restore_paused    "yes"
      auto_update       "yes"
      auto_update_depth 3

      input { 
        plugin "curl"
      }

      audio_output {
        type		"pipewire"
        name		"pipewire"
      } 

      audio_output {
         type	"fifo"
         name	"Visualizer feed"
         path	"/tmp/mpd.fifo"
         format	"44100:16:2"
      }

    '';

    extraArgs = [ ];

  };

  services.mpd-mpris = { network = "${domain_socket}"; };
}
