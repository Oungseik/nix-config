{config, pkgs, ...}:
{
  home.username = "oung";
  home.homeDirectory = "/home/oung";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 96;
  };

  home.packages = with pkgs; [
    jq
    unzip
    zip
  ];

  programs.git = {
    enable = true;
    userName = "Ryan Yin";
    userEmail = "xiaoyin_c@qq.com";
    formatPretty = "%h %ad | %s%d [%an]";
    logDate = "short";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  home.stateVersion = "unstable";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
