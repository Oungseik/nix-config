{ ... }: {
  programs.firefox = {
    profiles.oung = {

      bookmarks = import "./bookmarks";

      # change the browser look with this
      # userChrome = "\n";
    };
  };
}
