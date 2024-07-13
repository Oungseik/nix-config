{ ... }: {
  programs.nixvim.plugins.telescope = {
    enable = true;

    settings = {
      defaults = {
        file_ignore_patterns = [
          "^.git/"

          "^.mypy_cache/"
          "^__pycache__/"
          ".venv"
          "%.ipynb"

          "^output/"
          "^data/"

          "node_modules"
          "dist"
        ];
        layout_config = {
          # width = 0.75;
        };
      };
    };

  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>f";
      options.silent = true;
      options.desc = "Find File";
      action = "<cmd>Telescope find_files<CR>";
    }
    {
      mode = "n";
      key = "<leader>sf";
      options.silent = true;
      options.desc = "Find File";
      action = "<cmd>Telescope find_files<CR>";
    }
    {
      mode = "n";
      key = "<leader>st";
      options.silent = true;
      options.desc = "Find Text";
      action = "<cmd>Telescope live_grep<CR>";
    }
  ];
}
