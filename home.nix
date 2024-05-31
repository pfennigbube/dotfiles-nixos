{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yuna";
  home.homeDirectory = "/home/yuna";

  home.stateVersion = "23.11";
  # The home.packages option allows you to install Nix packages into your environment.

  home.packages = [ pkgs.hello ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = { EDITOR = "nvim"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # git
  programs.git = {
    enable = true;
    userName = "pfennigbube";
    userEmail = "lucaseckardt6@tutanota.com";
  };

  # helix
  programs.helix = {
    enable = true;
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
  };

  # qutebrowser
  programs.qutebrowser = { enable = true; };

  # waybar
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
                     * {
                       font-family: "JetBrainsMono Nerd Font";
                       font-size: 10pt;
                       font-weight: normal;
                       border-radius: 8px;
                       transition-property: background-color;
                       transition-duration: 0.5s;
                     }
                     @keyframes blink_red {
                       to {
                         background-color: rgb(242, 143, 173);
                         color: rgb(26, 24, 38);
                       }
                     }
                     .warning, .critical, .urgent {
                       animation-name: blink_red;
                       animation-duration: 1s;
                       animation-timing-function: linear;
                       animation-iteration-count: infinite;
                       animation-direction: alternate;
                     }
                     window#waybar {
                       background-color: transparent;
                     }
                     window > box {
                       margin-left: 5px;
                       margin-right: 5px;
                       margin-top: 5px;
                       background-color: #1e1e2a;
                       padding: 3px;
                       padding-left:8px;
                       border: 2px none #33ccff;
                     }
                     tooltip {
                       background: rgb(48, 45, 65);
                     }
                     tooltip label {
                       color: rgb(217, 224, 238);
                     }
               #custom-launcher {
                       font-size: 20px;
                       padding-left: 8px;
                       padding-right: 6px;
                       color: #7ebae4;
      		}



               #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal {
                       padding-left: 10px;
                       padding-right: 10px;
                     }
                     /* #mode { */
                     /* 	margin-left: 10px; */
                     /* 	background-color: rgb(248, 189, 150); */
                     /*     color: rgb(26, 24, 38); */
                     /* } */
               #memory {
                       color: rgb(181, 232, 224);
                     }
               #cpu {
                       color: rgb(245, 194, 231);
                     }
               #clock {
                       color: rgb(217, 224, 238);
                     }
              /* #idle_inhibitor {
                       color: rgb(221, 182, 242);
                     }*/
               #custom-wall {
                       color: #33ccff;
                  }
               #temperature {
                       color: rgb(150, 205, 251);
                     }
               #backlight {
                       color: rgb(248, 189, 150);
                     }
               #pulseaudio {
                       color: rgb(245, 224, 220);
                     }
               #network {
                       color: #ABE9B3;
                     }
               #network.disconnected {
                       color: rgb(255, 255, 255);
                     }
               #custom-powermenu {
                       color: rgb(242, 143, 173);
                       padding-right: 8px;
                     }
               #tray {
                       padding-right: 8px;
                       padding-left: 10px;
                     }
               #mpd.paused {
                       color: #414868;
                       font-style: italic;
                     }
               #mpd.stopped {
                       background: transparent;
                     }
               #mpd {
                       color: #c0caf5;
                     }
               #custom-cava-internal{
                       font-family: "Hack Nerd Font" ;
                       color: #33ccff;
      			}

      	#workspaces button {
      		color: #cdd6f4;
      	}

      	#workspaces button.active {
      	color: #eba0ac;
      	}
      	
      	#workspaces button.urgent {
      	color: #ca9ee6;
      	}


    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-left = [ "custom/launcher" "hyprland/workspaces" ];
      modules-center = [ "clock" "workspaces" ];
      modules-right = [ "pulseaudio" "memory" "cpu" "tray" ];
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "pkill rofi || rofi2";
        "on-click-middle" = "exec default_wall";
        "on-click-right" = "exec wallpaper_random";
        "tooltip" = false;
      };
      "custom/cava-internal" = {
        "exec" = "sleep 1s && cava-internal";
        "tooltip" = false;
      };
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = { "default" = [ "" "" "" ]; };
        "on-click" = "pamixer -t";
        "tooltip" = false;
      };
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
        "tooltip" = true;
        "tooltip-format" = ''
          {=%A; %d %B %Y}
          <tt>{calendar}</tt>'';
      };
      "memory" = {
        "interval" = 1;
        "format" = "󱖢 {percentage}%";
        "states" = { "warning" = 85; };
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰍛 {usage}%";
      };

      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
    }];
  };
}
