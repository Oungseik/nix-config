{ pkgs, ... }:
{
  home.packages = with pkgs; [ eza ];
  programs.zsh = {
    autocd = true;
    enableCompletion = true;
    syntaxHighlighting.enable = false;

    shellAliases = {
      ls = "eza";
      la = "eza -la";
      nix = "nix --experimental-features 'nix-command flakes pipe-operators'";
      home-manager = "home-manager --experimental-features 'nix-command flakes pipe-operators'";
    };

    history = {
      size = 20000;
      path = "$HOME/.zsh/zsh_history";
    };

    plugins = [
      # {
      #   # will source zsh-autosuggestions.plugin.zsh
      #   name = "zsh-autosuggestions";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "zsh-users";
      #     repo = "zsh-autosuggestions";
      #     rev = "v0.4.0";
      #     sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      #   };
      # }
    ];

    initContent = ''
      bindkey -e
      bindkey '^P' history-beginning-search-backward
      bindkey '^N' history-beginning-search-forward
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_find_no_dups

      zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
      zstyle ":completion:*" list-colors "\$\{(s.:.)LS_COLORS}" 
      zstyle ":completion:*" menu no

      alias vi="nvim"
      alias v="nvim"

      export EDITOR=nvim
      export PATH=~/.npm-global/bin:~/.local/bin:$PATH
      export PATH=$HOME/.cargo/bin:$PATH
      export NIXPKGS_ALLOW_UNFREE=1
      export AIRMUX_CONFIG=$HOME/.config/airmux

      autoload -U select-word-style
      select-word-style bash
    '';
  };

  # home.file.".zsh" = {
  #   source = ./scripts;
  #   recursive = true;
  #   executable = true;
  # };
}
