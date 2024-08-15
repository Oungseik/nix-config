{ pkgs, ... }: {
  programs.helix = {

    extraPackages = with pkgs; [
      marksman
    ];

    settings = {
      theme = "catppuccin-macchiato";

      editor = {
        lsp.display-messages = true;
      };

      keys.normal = {
        space.w = ":w";
        space.q = ":q";
      };
    };

    languages = {
      language = [
        { name = "rust"; auto-format = true; }
      ];
    };
  };
}
