{ ... }: {
  imports = [
    ./eza
    ./git
    ./helix
    ./starship
    ./tmux
    ./yazi
    ./zsh
  ];

  programs = {
    eza.enable = true;
    git.enable = true;
    yazi.enable = true;
  };
}
