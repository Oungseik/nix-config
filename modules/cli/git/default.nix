{ config, ... }:
{
  programs.git = {
    settings = {
      init = {
        defaultBranch = "main";
      };

      format = {
        pretty = "[%C(yellow)%h%C(reset)] %C(blue)%ad%C(reset) | %s%d [%an]";
      };

      log = {
        date = "short";
      };

      user.name = "Min Aung Thu Win";
      user.email = "mhemaungthuwin@gmail.com";
    };
  };
}
