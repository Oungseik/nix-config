# checkout https://github.com/dc-tec/nixvim/blob/21072b364c6b8627cbb7a360556eadb3f3a8d412/config/plugins/lsp/lsp.nix
{ ... }: {

  programs.nixvim.plugins = {
    lsp-lines.enable = true;
    lsp-lines.currentLine = true;
    # lsp-format.enable = true;
    # helm.enable = true;

    lsp = {
      enable = true;

      servers = {
        rust-analyzer.enable = true;
        rust-analyzer.installRustc = false;
        rust-analyzer.installCargo = false;

        gopls.enable = true;
        lua-ls.enable = true;
        marksman.enable = true;
        nil-ls.enable = true;
        tsserver.enable = true;
        jsonls.enable = true;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          # gr = {
          #   action = "references";
          #   desc = "Goto References";
          # };
          # gD = {
          #   action = "declaration";
          #   desc = "Goto Declaration";
          # };
          # gI = {
          #   action = "implementation";
          #   desc = "Goto Implementation";
          # };
          # gT = {
          #   action = "type_definition";
          #   desc = "Type Definition";
          # };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>lS" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>ls" = {
            action = "document_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>lr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>lw" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "<leader>lj" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "<leader>lk" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };

  programs.nixvim.extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}

