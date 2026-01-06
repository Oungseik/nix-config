{ ... }:
{
  imports = [
    ./atuin
    ./btop
    ./eza
    ./fzf
    ./git
    ./helix
    ./starship
    ./tmux
    ./yazi
    ./zellij
    ./zsh
  ];

  programs = {
    atuin.enable = true;
    btop.enable = true;
    eza.enable = true;
    git.enable = true;
    helix.enable = true;
    starship.enable = true;
    # tmux.enable = false;
    yazi.enable = true;
    zellij.enable = true;
  };
}
