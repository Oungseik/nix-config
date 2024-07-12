{ ... }: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      settings.indent.enable = true;
      settings.ensure_installed = [
      ];
      settings.highlight.disable = ''
        function ()
          if vim.fn.strwidth(vim.fn.getline('.')) > 300
            or vim.fn.getfsize(vim.fn.expand('%')) > 1024 * 1024 then
            return false
          else
            return true
          end
        end
      '';
    settings.parser_install_dir = "$HOME/.local/share/treesitter";
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}
