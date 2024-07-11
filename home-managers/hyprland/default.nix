{ pkgs, ... }: {
  # hyprland - Tiling compositor with the looks
  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      "$mod" = "SUPER";

      monitor = ", preferred, auto, 1";

      input = {
        kb_layout = "us, mm";
        kb_options = "grp:win_space_toggle";

        follow_mouse = 1;

        touchpad.natural_scroll = false;
        sensitivity = 0;
      };

      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;
        col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        col.inactive_border = "rgba(595959aa)";

        layout = "master";
        allow_tearing = false;
      };

      decoration = {
        rounding = 6;
  
        blur.enable = false;
  
        drop_shadow = false;
        shadow_rnage = 4;
        shadow_render_power = 3;
        col.shadow = "rgba(1a1a1acc)";
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.8, 0.1, 1.00";

        animation = [
           "windows, 1, 4, myBezier"
           "windowsOut, 1, 4, default, popin 80%"
           "border, 1, 7, default"
           "borderangle, 1, 6, default"
           "fade, 1, 5, default"
           "workspaces, 1, 5, default"
        ];
      };

      dwindle = {
        pseudotile = false;
        preserve_split = true;
      };

      master = {
        special_scale_factor = 0.9;
        mfact = "+0.625";
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        force_default_wallpaper = 2;
      };

      bind = [
        "$mod, RETURN, exec, ${pkgs.kitty}"
        "$mod, E, exec, $TERMINAL -e ${pkgs.yazi}"
        "UPER_SHIFT, q, killactive, "
        "UPER_SHIFT, X, exit, "
        "$mod, V, togglefloating, "
        "$mod, p, exec, pkill ${pkgs.wofi} || ${pkgs.wofi} --dmenu --show drun"

        "$mod, M, fullscreen, 1"
        "$mod, F, fullscreen, 0"

        "$mod SHIFT, DELETE, exec, hyprlock"

        # brightness and sound control
        ", f2, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%- "
        ", f3, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+ "
        ", f9, exec, brightnessctl set 5%- "
        ", f10, exec, brightnessctl set +5% "

        # Screenshot and save to a file
        ", Print, exec, IMG=$HOME/Pictures//Screenshots/$(date +'%s_grim.png') && ${pkgs.grim} -c -o \"$(hyprctl activeworkspace -j | ${pkgs.jq} -r '.monitor')\" $IMG && wl-copy < $IMG"
        "$mod, Print, exec, IMG=$HOME/Pictures/Screenshots/$(date +'%s_grim.png') && ${pkgs.grim} -c -g \"$(${pkgs.slurp})\" $IMG && wl-copy < $IMG"

        # Layout Messages Dispatchers
        "$mod, j, layoutmsg, cyclenext"
        "$mod, k, layoutmsg, cycleprev"
        "$mod, Tab, layoutmsg, cyclenext"
        "$mod_SHIFT, Tab, layoutmsg, cycleprev"

        # Move focus with mod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Switch workspaces with mod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"

        "$mod_SHIFT, j, layoutmsg, swapwithmaster master"

        "$mod, S, togglespecialworkspace, magic"
        "$mod_SHIFT, S, movetoworkspace, special:magic"

        "$mod Control, h, movecurrentworkspacetomonitor, 0 "
        "$mod Control, l, movecurrentworkspacetomonitor, 1 "

        "$mod SHIFT, h, focusmonitor, -1 "
        "$mod SHIFT, l, focusmonitor, +1 "
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow" 
      ];

    };

    extraConfig = ''
      source = ~/.config/hypr/hyprland-extra.conf
    '';
  };

  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/hypr/wal.jpg".source = ./wal.jpg;

  home.file.".config/hyprland/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

  # wayland.windowManager.hyprland.systemd.variables = ["--all"];
}
