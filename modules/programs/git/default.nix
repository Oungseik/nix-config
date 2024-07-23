{ ... }: {
  programs.git = {
    userName = "Min Aung Thu Win";
    userEmail = "mhemaungthuwin@gmail.com";
    extraConfig = {
      global = {
        userName = "Min Aung Thu Win";
        userEmail = "mhemaungthuwin@gmail.com";

        initDefaultBranch = "main";
        formatPretty = "format:'%h %ad | %s%d [%an]'";
        logDate = "short";
      };
    };
  };
}
