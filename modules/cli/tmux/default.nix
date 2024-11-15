{ pkgs, ... }:
{
  programs.tmux = {
    baseIndex = 1;
    clock24 = true;

    keyMode = "vi";
    mouse = true;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.tmux-nova
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

      # set -g @nova-pane "#{?window_active,󰫣 ,}#I:#W"
      #
      # set -g @nova-pane-active-border-style "#44475a"
      # set -g @nova-pane-border-style "#282a36"
      # set -g @nova-status-style-bg "#24273a"
      # set -g @nova-status-style-fg "#f5a97f" # default pane color
      #
      # set -g @nova-status-style-active-bg "#24273a"
      # set -g @nova-status-style-active-fg "#91d7e3"
      # set -g @nova-status-style-double-bg "#24273a"
      #
      # set -g @nova-segment-os " ::"
      # set -g @nova-segment-os-colors "#24273a #8aadf4"
      #
      # set -g @nova-segment-computer " :#h"
      # set -g @nova-segment-computer-colors "#24273a #c6a0f6"
      #
      # set -g @nova-segment-session " :#S"
      # set -g @nova-segment-session-colors "#24273a #8aadf4"
      #
      # set -g @nova-rows 0
      # set -g @nova-segments-0-left "os"
      # set -g @nova-segments-0-right "computer session"
    '';
  };
}
