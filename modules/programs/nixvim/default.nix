{ inputs, ... }: {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];

  programs.nixvim = {
    defaultEditor = true;
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
    };

    luaLoader.enable = true;
  };
}
