{ pkgs, ... }:
let
  plugins-repo = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "d1c8baab86100afb708694d22b13901b9f9baf00";
    hash = "sha256-52Zn6OSSsuNNAeqqZidjOvfCSB7qPqUeizYq/gO+UbE=";
  };
  starship = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "a63550b2f91f0553cc545fd8081a03810bc41bc0";
    sha256 = "sha256-PYeR6fiWDbUMpJbTFSkM57FzmCbsB4W4IXXe25wLncg=";
  };
  yamb = pkgs.fetchFromGitHub {
    owner = "h-hg";
    repo = "yamb.yazi";
    rev = "22af0033be18eead7b04c2768767d38ccfbaa05b";
    hash = "sha256-NMxZ8/7HQgs+BsZeH4nEglWsRH2ibAzq7hRSyrtFDTA=";
  };
in
{

  programs.yazi = {
    enableZshIntegration = true;

    settings = {
      manager = {
        show_hidden = false;
      };
      # preview = {
      # max_width = 1000;
      # max_height = 1000;
      # };
    };

    theme = import ./themes/catppuccin.nix;

    plugins = {
      inherit starship;
      inherit yamb;
      full-border = "${plugins-repo}/full-border.yazi";
    };

    keymap = {
      manager.prepend_keymap = import ./keymaps/yamb.nix;
    };

    initLua = ''
      require("starship"):setup()
      require("full-border"):setup {
      	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
      	type = ui.Border.ROUNDED,
      }

      -- You can configure your bookmarks by lua language
      local bookmarks = {}

      local path_sep = package.config:sub(1, 1)
      local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
      if ya.target_family() == "windows" then
        table.insert(bookmarks, {
          tag = "Scoop Local",
          
          path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
          key = "p"
        })
        table.insert(bookmarks, {
          tag = "Scoop Global",
          path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
          key = "P"
        })
      end
      table.insert(bookmarks, {
        tag = "Desktop",
        path = home_path .. path_sep .. "Desktop" .. path_sep,
        key = "d"
      })

      require("yamb"):setup {
        -- Optional, the path ending with path seperator represents folder.
        bookmarks = bookmarks,
        -- Optional, recieve notification everytime you jump.
        jump_notify = true,
        -- Optional, the cli of fzf.
        cli = "fzf",
        -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
        keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
        -- Optional, the path of bookmarks
        path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
              (os.getenv("HOME") .. "/.config/yazi/bookmark"),
      }
    '';
  };
}
