{ ... }: {
  programs.nixvim = {
    extraConfigLuaPre = ''
      vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
    '';

    clipboard = { providers.wl-copy.enable = true; };

    opts = {
      number = true;
      relativenumber = false;
      termguicolors = true;
      showmode = false;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      scrolloff = 8;
      foldmethod = "manual";
      foldenable = false;
      linebreak = true;
      cursorline = true;
      signcolumn = "yes";

      wrap = false;

      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      breakindent = true;
    };
  };
}
