{ ... }: {
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = false;
      termguicolors = true;

      wrap = false;
      shiftwidth = 2;
      tabstop = 2;
    };
  };
}
