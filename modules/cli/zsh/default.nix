{ pkgs, ... }:
{
  home.packages = with pkgs; [ eza ];
  programs.zsh = {
    autocd = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza";
      la = "eza -la";
      vi = "nvim";
      nix = "nix --experimental-features 'nix-command flakes'";
      home-manager = "home-manager --experimental-features 'nix-command flakes'";
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh/zsh_history";
    };

    initExtra = ''
      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_find_no_dups

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "\$\{(s.:.)LS_COLORS}" 
      zstyle ':completion:*' menu no
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # home.file.".zsh" = {
  #   source = ./scripts;
  #   recursive = true;
  #   executable = true;
  # };
}
