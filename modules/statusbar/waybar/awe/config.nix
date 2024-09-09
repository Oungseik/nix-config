# Contains hyprland specific configurations 
{
  mainBar = {
    layer = "top";
    position = "top";
    height = 34;
    margin = "3, 0, 2, 0";
    # output = [ "eDP-1" "HDMI-A-1" ];

    modules-left = [
      "custom/wmname"
      "custom/separator"
      "hyprland/workspaces"
      "custom/separator"
      "cpu"
      "custom/separator"
      "memory"
      "custom/separator"
      "network"
      "custom/recorder"
      "custom/audiorec"
    ];
    modules-center = [
      "tray"
      "mpd"
    ];
    modules-right = [
      "idle_inhibitor"
      "custom/separator"
      "hyprland/language"
      "custom/separator"
      "backlight"
      "custom/separator"
      "battery"
      "custom/separator"
      "pulseaudio"
      "custom/separator"
      "clock"
    ];

    # modules configurations
    "hyprland/workspaces" = {
      "format" = "{icon}";
      "format-icons" = {
        "1" = "1.";
        "2" = "2.";
        "3" = "3.";
        "4" = "4.";
        "5" = "5.";
        "6" = "6.";
        "7" = "7.";
        "8" = "8.";
        "9" = "9.";
        "urgent" = "";
        "focused" = "";
        "default" = "";
      };
    };

    "custom/wmname" = {
      "format" = " ";
      "tooltip" = false;
    };

    "custom/separator" = {
      "format" = "|";
      "interval" = "once";
      "tooltip" = false;
    };

    "idle_inhibitor" = {
      "format" = "{icon}";
      "format-icons" = {
        "activated" = " ";
        "deactivated" = " ";
      };
    };
    "tray" = {
      "icon-size" = 20;
      "spacing" = 6;
    };
    "clock" = {
      "interval" = 1;
      "locale" = "C";
      "tooltip" = false;
      "format" = " {:%I:%M %p}";
      "format-alt" = " {:%a,%b %d}";
    };
    "cpu" = {
      "format" = " &#8239;{usage}%";
      "tooltip" = false;
      "on-click" = "alacritty -e 'btop'";
    };
    "memory" = {
      "interval" = 30;
      "format" = " {used:0.2f}GB";
      "max-length" = 10;
      "tooltip" = false;
      "warning" = 70;
      "critical" = 90;
    };

    "backlight" = {
      "tooltip" = false;
      "format" = "{icon}&#8239;{percent}%";
      "format-icons" = [
        "󱩎 "
        "󱩏 "
        "󱩐 "
        "󱩑 "
        "󱩒 "
        "󱩓 "
        "󱩔 "
        "󱩕 "
        "󱩖 "
        "󰛨 "
      ];
      "on-scroll-down" = "brightnessctl -c backlight set 1%-";
      "on-scroll-up" = "brightnessctl -c backlight set +1%";
    };
    "battery" = {
      "states" = {
        "warning" = 30;
        "critical" = 15;
      };
      "format" = "{icon}&#8239;{capacity}%";
      "format-charging" = " &#8239;{capacity}%";
      "format-plugged" = " &#8239;{capacity}%";
      "format-alt" = "{icon} {time}";
      "format-icons" = [
        " "
        " "
        " "
        " "
        " "
      ];
    };
    "network" = {
      "format-wifi" = "{icon}&#8239;{signalStrength}%";
      "format-icons" = [
        "󰤟 "
        "󰤢 "
        "󰤥 "
        "󰤨 "
      ];
      "format-ethernet" = "&#8239;{ifname}: {ipaddr}/{cidr}";
      "format-linked" = "&#8239;{ifname} (No IP)";
      "format-disconnected" = "✈&#8239;Disconnected";
      "format-alt" = "{ifname}: {ipaddr}/{cidr}";
      "tooltip-format" = "{essid}: {ipaddr}";
    };
    "pulseaudio" = {
      "format" = "{icon} {volume}% {format_source}";
      "format-bluetooth" = "{icon} {volume}% {format_source}";
      "format-bluetooth-muted" = " {format_source}";
      "format-muted" = "  {format_source}";
      "format-source" = " {volume}%";
      "format-source-muted" = " ";
      "format-icons" = {
        "headphone" = " ";
        "hands-free" = "";
        "headset" = "🎧";
        "phone" = " ";
        "portable" = " ";
        "car" = " ";
        "default" = [
          " "
          " "
          " "
        ];
      };
      "on-click" = "pavucontrol";
    };
    "mpd" = {
      "format" = "♪ {artist} - {title}";
      "format-disconnected" = "🎶";
      "format-stopped" = "♪";
      "interval" = 10;
      "consume-icons" = {
        "on" = " ";
      };
      "random-icons" = {
        "off" = "<span color=\"#f53c3c\"> </span> ";
        "on" = " ";
      };
      "repeat-icons" = {
        "on" = " ";
      };
      "single-icons" = {
        "on" = " 1 ";
      };
      "state-icons" = {
        "paused" = "";
        "playing" = "";
      };
      "tooltip-format" = "MPD (connected)";
      "tooltip-format-disconnected" = "MPD (disconnected)";
      "max-length" = 45;
      "on-click" = "mpc toggle";
    };
    "custom/recorder" = {
      "format" = " Rec";
      "format-disabled" = " Off-air";
      "return-type" = "json";
      "interval" = 1;
      "exec" = "echo '{\"class\": \"recording\"}'";
      "exec-if" = "pgrep wf-recorder";
    };

    "custom/audiorec" = {
      "format" = "♬ Rec";
      "format-disabled" = "♬ Off-air";
      "return-type" = "json";
      "interval" = 1;
      "exec" = "echo '{\"class\": \"audio recording\"}'";
      "exec-if" = "pgrep ffmpeg";
    };
    "hyprland/language" = {
      "format" = "  {short}";
      "keyboard-name" = "at-translated-set-2-keyboard";
    };
  };

}
