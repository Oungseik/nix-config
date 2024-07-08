{...}:
{
  programs.git = {
    userName = "Ryan Yin";
    userEmail = "xiaoyin_c@qq.com";
    extraConfig = {
      global = {
        formatPretty = "format:'%h %ad | %s%d [%an]'";
        logDate = "short";
      };
    };
  };
}
