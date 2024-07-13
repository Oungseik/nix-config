{ ... }: {
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      options.silent = true;
      options.desc = "Explorer";
      action = "<cmd>Neotree position=right toggle<CR>";
    }

    # utility
    {
      mode = "n";
      key = "<leader>q";
      options.silent = true;
      options.desc = "Quit";
      action = "<cmd>q<CR>";
    }
    {
      mode = "n";
      key = "<leader>w";
      options.silent = true;
      options.desc = "Save";
      action = "<cmd>w<CR>";
    }

    {
      mode = "n";
      key = "<C-l>";
      options.silent = true;
      action = "<C-w>l";
    }
    {
      mode = "n";
      key = "<C-h>";
      options.silent = true;
      action = "<C-w>h";
    }
    {
      mode = "n";
      key = "<C-j>";
      options.silent = true;
      action = "<C-w>j";
    }
    {
      mode = "n";
      key = "<C-k>";
      options.silent = true;
      action = "<C-w>k";
    }
  ];
}
