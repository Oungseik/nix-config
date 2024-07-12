{ ... }: {
  programs.nixvim.plugins.telescope = {
    enable = true;

    settings = {
      defaults = {
        layout_config = {
          width = 0.75;
        };
      };
    };

  };
}
