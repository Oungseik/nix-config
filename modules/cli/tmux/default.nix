{ pkgs, ... }: {
  programs.tmux = {
    baseIndex = 1;
    clock24 = true;

    keyMode = "vi";
    mouse = true;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = ''
      set -g focus-events on
      
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel

      bind -n C-S-H previous-window
      bind -n C-S-L next-window
    '';
  };
}
