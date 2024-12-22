{ config, ... }:
let
  mpdDir = "${config.home.homeDirectory}/.local/share/mpd";
in
{
  services.mpd = {
    dataDir = mpdDir;
    musicDirectory = "${config.home.homeDirectory}/Music";
    dbFile = "${mpdDir}/tag_cache";
    playlistDirectory = "${mpdDir}//playlists";

    network.listenAddress = "127.0.0.1";
    network.port = 6600;

    extraConfig = ''
      user              "${config.home.username}"
      restore_paused    "yes"
      auto_update       "yes"
      auto_update_depth "3"

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
         format	"44100:16:1"
      }

    '';

    extraArgs = [ ];
  };
}
