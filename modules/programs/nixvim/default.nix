{ inputs, ... }: {

  imports = [ inputs.nixvim.homeManagerModules.nixvim ./plugins ];

  programs.nixvim = {
    defaultEditor = true;
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
      settings.integrations.native_lsp.enabled = true;
    };

    luaLoader.enable = true;
  };
}
