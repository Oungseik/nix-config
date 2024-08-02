[
  {
    name = "Gmail";
    tags = [ "gmail" "email" ];
    toolbar = true;
    keyword = "gmail";
    url = "https://mail.google.com/mail/u/0/#inbox";
  }
  {
    name = "Google Drive";
    tags = [ "Google-Drive" "Drive" ];
    toolbar = true;
    keyword = "Drive";
    url = "https://drive.google.com/drive/u/0/my-drive";
  }
  {
    name = "Github";
    tags = [ "github" "Oungseik" ];
    toolbar = true;
    keyword = "github";
    url = "https://github.com/Oungseik";
  }

  {
    name = "Nix Resources";
    tags = [ "nix" "home-manager" "nixos" ];
    toolbar = true;
    bookmarks = import ./nix-resources.nix;
  }
  {
    name = "Game ISO";
    tags = [ "ps2" "psp" "playstation" "rom" ];
    toolbar = true;
    bookmarks = import ./game-iso.nix;
  }
  {
    name = "Wallpapers";
    tags = [ "wallpaper" ];
    toolbar = true;
    bookmarks = import ./wallpapers.nix;
  }
  {
    name = "Unix Rice";
    tags = [ "rice" "widget" "theme" ];
    toolbar = true;
    bookmarks = import ./rice.nix;
  }

  # programming and programming language
  {
    name = "Functional Programming";
    tags = [ "fp" "functional programming" ];
    toolbar = false;
    bookmarks = import ./fp.nix;
  }

  {
    name = "Tutorials";
    tags = [ "tutorials" "git" "docker" ];
    toolbar = false;
    bookmarks = import ./tutorials.nix;
  }
]
