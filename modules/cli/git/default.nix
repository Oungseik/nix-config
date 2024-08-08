{ config, ... }: {
  programs.git = {
    userName = "Min Aung Thu Win";
    userEmail = "mhemaungthuwin@gmail.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      format = {
        pretty = "%C(yellow)%h%C(reset) %C(blue)%ad%C(reset) | %s%d [%an]";
      };

      log = {
        date = "short";
      };
    };
  };
}
