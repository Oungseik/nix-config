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
}
