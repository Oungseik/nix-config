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
  };
}
