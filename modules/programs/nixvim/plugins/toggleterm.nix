{ ... }: {
  programs.nixvim.plugins.toggleterm = {
    enable = true;

    settings = {
      direction = "float";
      float_opts.border = "rounded";
      shading_factor = 2;
      size = 10;

      highlights = {
        Normal.link = "Normal";
        NormalNC.link = "NormalNC";
        NormalFloat.link = "NormalFloat";
        FloatBorder.link = "FloatBorder";
        StatusLine.link = "StatusLine";
        StatusLineNC.link = "StatusLineNC";
        WinBar.link = "WinBar";
        WinBarNC.link = "WinBarNC";
      };

      on_create = ''
        function(t)
          vim.opt_local.foldcolumn = "0"
          vim.opt_local.signcolumn = "no"
          if t.hidden then
            vim.keymap.set({ "n", "t", "i" }, "<F7>", function() t:toggle() end, { desc = "Toggle terminal", buffer = t.bufnr })
          end
          local term_name = "floating-terminal"
          vim.cmd(t.id .. "ToggleTermSetName " .. term_name)
        end
      '';
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<M-3>";
      action = "<Cmd>ToggleTerm direction=float<CR>";
      options.desc = "Open floating terminal";
    }
    {
      mode = "n";
      key = "<M-3>";
      action = "<Cmd>execute v:count . 'ToggleTerm'<CR>";
      options.desc = "Toggle terminal";
    }
    {
      mode = "t";
      key = "<M-3>";
      action = "<Cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }
    {
      mode = "i";
      key = "<M-3>";
      action = "<Esc><Cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }
  ];


}
