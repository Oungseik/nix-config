{ ... }: {
  programs.nixvim.plugins = {
    bufferline = {
      enable = true;
      diagnostics = "nvim_lsp";
      mode = "buffers";

      closeIcon = " ";
      bufferCloseIcon = "󰱝 ";
      modifiedIcon = "";

      offsets = [{
        filetype = "neo-tree";
        text = "Neo-tree";
        highlight = "Directory";
        text_align = "left";
      }];
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<S-h>";
      options.silent = true;
      action = "<cmd>BufferLineCyclePrev<CR>";
    }
    {
      mode = "n";
      key = "<S-l>";
      options.silent = true;
      action = "<cmd>BufferLineCycleNext<CR>";
    }
    {
      mode = "n";
      key = "<leader>c";
      options.silent = true;
      options.desc = "Close Buffer";
      action = "<cmd>bdelete<CR>";
    }
    {
      mode = "n";
      key = "<leader>bl";
      options.silent = true;
      options.desc = "Close all right";
      action = "<cmd>BufferLineCloseRight<CR>";
    }
    {
      mode = "n";
      key = "<leader>bh";
      options.silent = true;
      options.desc = "Close all left";
      action = "<cmd>BufferLineCloseLeft<CR>";
    }
    {
      mode = "n";
      key = "<leader>ba";
      options.silent = true;
      options.desc = "Close all others";
      action = "<cmd>BufferLineCloseOthers<CR>";
    }
    {
      mode = "n";
      key = "<leader>bf";
      options.silent = true;
      options.desc = "Find in buffers";
      action = "<cmd>Telescope buffers<CR>";
    }
  ];
}
