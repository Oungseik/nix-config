{ ... }:
{
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
    helix.enable = false;
    starship.enable = true;
    tmux.enable = false;
    yazi.enable = true;
  };
}
