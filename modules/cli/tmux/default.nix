{ pkgs, ... }:
{
  programs.tmux = {
    baseIndex = 1;
    clock24 = true;

    keyMode = "vi";
    mouse = true;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.catppuccin
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = ''
      set -ag terminal-overrides ",alacritty:RGB"
      set -ga terminal-overrides ",xterm-256color*:Tc"
      set -g focus-events on

      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel

      bind -n C-H previous-window
      bind -n C-L next-window
    '';
  };
}
