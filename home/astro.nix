{ pkgs, inputs, ... }: {
  home = {
    username = "astro";
    homeDirectory = "/home/astro";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../modules/programs/starship
    ../modules/programs/yazi
    ../modules/programs/zsh
  ];

  programs = {
    starship.enable = true;
    yazi.enable = true;
    zsh.enable = true;
  };

  home.packages = with pkgs; [
    inputs.nixvim.packages.${system}.default
    # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    age
    go
    ssh-to-age
    jq
    ripgrep
    unzip
    zip
  ];

  home.sessionVariables = { EDITOR = "nvim"; };

  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
