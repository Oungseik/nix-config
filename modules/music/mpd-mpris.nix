{ ... }: {
  services.mpd-mpris = {
    mpd = {
      host = "127.0.0.1";
      network = "tcp"; # or unix
      port = 6600;
    };
  };
}
