{ pkgs, inputs, ... }: {
  programs.helix = {
    package = inputs.helix.packages.${pkgs.system}.helix;

    extraPackages = with pkgs; [
      marksman
    ];

    ignores = [
      ".build/"
      "!.gitignore"
      "node_modules"
      ".venv"
    ];

    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
      ];
    };

    settings = {
      theme = "catppuccin-macchiato";

      editor = {
        lsp.display-message = true;
      };

      keys.normal = {
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
  };
}
