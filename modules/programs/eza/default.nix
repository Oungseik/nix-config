{ ... }: {
  programs.eza = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    icons = true;

    extraOptions = [
    ];
  };
}
