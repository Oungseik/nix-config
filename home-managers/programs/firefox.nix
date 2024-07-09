{...}:
{
  programs.firefox = {
    profiles.oung = {
      
      bookmarks = [
        {
          name = "github/Oungseik";
          tags = ["github profile"];
          keyword = "github";
          url = "https://github.com/Oungseik";
        }
      ];

      # change the browser look with this
      userChrome = ''

      '';

    };
  };
}
